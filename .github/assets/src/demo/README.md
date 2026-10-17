# Demo recording

`demo.gif` is a real Claude Code session (Sonnet 5.5) running `pd-design-lead` on a small fictional project
whose README asks to "let people pause a habit without losing the streak". The agent ran with no shell and no
web access and wrote no files.

1. `vhs demo.tape` records the session to `demo.mp4` (needs [VHS](https://github.com/charmbracelet/vhs)).
2. Render the overlays and cards from `film.html` (`?m=bg`, `b1`, `b6`, `bp`, `b15`, `intro`, `outro&k=0..12&n=12`)
   into `p/`, then `bash build.sh` cuts the film: typing at real speed, skill loading at ×6, the plan paused to
   read, and the closing receipt. Speed changes are labeled on screen.
3. Convert to GIF with ffmpeg (`fps=12`, `palettegen` + `paletteuse`).
