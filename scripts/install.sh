#!/usr/bin/env bash
# Install the pd-* skills into one or more agent runtimes.
#
#   scripts/install.sh                          # symlink into every runtime found on this machine
#   scripts/install.sh claude codex             # only these runtimes
#   scripts/install.sh --copy agents            # copy instead of symlink
#   scripts/install.sh --dir ./.claude/skills   # a custom (e.g. project-level) skills dir
#   scripts/install.sh --uninstall              # remove only what this script installed
#
# Runtimes:  claude → ~/.claude/skills   codex → ~/.codex/skills
#            agents → ~/.agents/skills   (shared dir read by Gemini CLI / Antigravity and other agents)
#            gemini → ~/.gemini/skills
#
# Symlinks are the default: edit the repo once and every runtime sees the change.
# Anything already at a skill's path that this script didn't install (a folder, a copy, a link to
# somewhere else) is moved to $PD_BACKUP_DIR (default ~/.pd-design-team-backups), never deleted. Backups
# live outside the skills dir so runtimes don't load them as duplicate skills.
# Works with macOS's default bash 3.2.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
SRC="$REPO/skills"
BACKUP_ROOT="${PD_BACKUP_DIR:-$HOME/.pd-design-team-backups}"
MARKER=".pd-design-team"
MODE=link
UNINSTALL=0
TARGETS=()

runtime_dir() {
  case "$1" in
    claude) echo "$HOME/.claude/skills" ;;
    codex)  echo "$HOME/.codex/skills" ;;
    agents) echo "$HOME/.agents/skills" ;;
    gemini) echo "$HOME/.gemini/skills" ;;
  esac
}

# True when $1 is something this script installed from this repo: a symlink to the matching skill
# folder, or a copy carrying our marker file.
owned() {
  local path="$1" name="$2" target
  if [[ -L "$path" ]]; then
    target="$(readlink "$path")"
    [[ "$target" == "$SRC/$name" ]]
  else
    [[ -f "$path/$MARKER" && "$(cat "$path/$MARKER")" == "$REPO" ]]
  fi
}

# Canonical absolute path of a directory that may not exist yet.
canonical() {
  local p="$1" suffix=""
  while [[ ! -d "$p" ]]; do suffix="/$(basename "$p")$suffix"; p="$(dirname "$p")"; done
  echo "$(cd "$p" && pwd -P)$suffix"
}

backup() {
  local path="$1" label="$2" dest
  dest="$BACKUP_ROOT/$label/$STAMP"
  mkdir -p "$dest"
  mv "$path" "$dest/"
  echo "  moved existing $path → $dest/"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --copy) MODE=copy ;;
    --uninstall) UNINSTALL=1 ;;
    --dir) shift; TARGETS+=("dir:$1") ;;
    -h|--help) sed -n '2,19p' "$0"; exit 0 ;;
    claude|codex|agents|gemini) TARGETS+=("$1") ;;
    *) echo "unknown argument: $1" >&2; exit 2 ;;
  esac
  shift
done

if [[ ${#TARGETS[@]} -eq 0 ]]; then
  for rt in claude codex agents gemini; do
    if [[ -d "$(dirname "$(runtime_dir "$rt")")" ]]; then TARGETS+=("$rt"); fi
  done
fi
if [[ ${#TARGETS[@]} -eq 0 ]]; then
  echo "No agent runtimes found. Pass one explicitly or use --dir." >&2
  exit 1
fi

STAMP="$(date +%Y%m%d-%H%M%S)"
for target in "${TARGETS[@]}"; do
  if [[ "$target" == dir:* ]]; then
    dest="${target#dir:}"; label="custom-$(echo "$dest" | tr '/' '_')"
  else
    dest="$(runtime_dir "$target")"; label="$target"
  fi
  dest="$(canonical "$dest")"
  case "$dest/" in
    "$REPO/"*) echo "refusing to install into this repository ($dest)" >&2; exit 2 ;;
  esac
  [[ $UNINSTALL -eq 1 && ! -d "$dest" ]] && { echo "$dest: nothing installed"; continue; }
  mkdir -p "$dest"
  done_count=0; skipped=0
  for skill in "$SRC"/pd-*/; do
    name="$(basename "$skill")"
    path="$dest/$name"
    if [[ $UNINSTALL -eq 1 ]]; then
      if [[ -e "$path" || -L "$path" ]]; then
        if owned "$path" "$name"; then rm -rf "$path"; done_count=$((done_count+1))
        else echo "  left $path alone (not installed by this script)"; skipped=$((skipped+1)); fi
      fi
      continue
    fi
    if [[ -e "$path" || -L "$path" ]]; then
      if owned "$path" "$name"; then rm -rf "$path"; else backup "$path" "$label"; fi
    fi
    if [[ $MODE == link ]]; then
      ln -s "$SRC/$name" "$path"
    else
      cp -R "$SRC/$name" "$path"
      cp "$REPO/LICENSE" "$path/LICENSE"
      echo "$REPO" > "$path/$MARKER"
    fi
    done_count=$((done_count+1))
  done
  if [[ $UNINSTALL -eq 1 ]]; then
    echo "$dest: removed $done_count skills${skipped:+, left $skipped untouched}"
  else
    if [[ $MODE == link ]]; then verb=linked; else verb=copied; fi; echo "$dest: $verb $done_count skills"
  fi
done
