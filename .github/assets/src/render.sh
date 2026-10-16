#!/bin/bash
# Renders the README images and the plugin icon from the HTML sources in this folder.
# Needs Google Chrome (headless) and python3. Run from anywhere: .github/assets/src/render.sh
set -euo pipefail
SRC=$(cd "$(dirname "$0")" && pwd)
ASSETS=$(dirname "$SRC")
ROOT=$(cd "$ASSETS/../.." && pwd)
CHROME=${CHROME:-"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"}
MOCKS="$ROOT/examples/pantry-meal-planner/mocks"

shot() { # html out width height scale
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=8000 \
    --force-device-scale-factor="$5" --window-size="$3,$4" --screenshot="$2" "file://$SRC/$1" 2>/dev/null
  echo "rendered $2"
}

# The example image shows only the week screen of the coded mock.
mkdir -p "$SRC/.build"
python3 - "$MOCKS" "$SRC/.build/mock-week.html" <<'PY'
import sys
mocks, out = sys.argv[1], sys.argv[2]
s = open(mocks + "/week-planner.html").read()
s = s.replace("<head>", '<head><base href="file://' + mocks + '/">', 1)
s = s.replace("</style>", "header,.skip,.mock-label,section.screen:not(#week){display:none!important}"
              " main{padding-bottom:24px!important}</style>", 1)
open(out, "w").write(s)
PY
"$CHROME" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=8000 --force-device-scale-factor=2 \
  --window-size=900,620 --screenshot="$SRC/.build/mock-week.png" "file://$SRC/.build/mock-week.html" 2>/dev/null

shot hero.html    "$ASSETS/hero.png"           1280 640 2
shot hero.html    "$ASSETS/social-preview.png" 1280 640 1
shot team.html    "$ASSETS/team.png"           1280 790 2
shot states.html  "$ASSETS/states.png"         1280 800 2
shot example.html "$ASSETS/example.png"        1280 830 2
shot icon.html    "$ROOT/.claude-plugin/icon.png" 1024 1024 1
