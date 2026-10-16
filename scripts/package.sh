#!/usr/bin/env bash
# Build zips for runtimes that take uploaded skills (e.g. claude.ai settings → Skills).
#
#   dist/<skill>.zip          one per skill, each with the LICENSE
#   dist/pd-design-team.zip   all skills in one archive
#
# Every specialist loads pd-foundations, so upload pd-foundations (and pd-design-lead) together with
# whichever specialists you want.
set -euo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="$REPO/dist"
STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT
rm -rf "$DIST" && mkdir -p "$DIST"
for skill in "$REPO"/skills/pd-*/; do
  name="$(basename "$skill")"
  cp -R "$skill" "$STAGE/$name"
  cp "$REPO/LICENSE" "$STAGE/$name/LICENSE"
  (cd "$STAGE" && zip -qr "$DIST/$name.zip" "$name" -x '*/.DS_Store')
done
(cd "$STAGE" && zip -qr "$DIST/pd-design-team.zip" pd-* -x '*/.DS_Store')
echo "Built $(ls "$DIST" | wc -l | tr -d ' ') zips in dist/ (upload pd-foundations with any specialist)"
