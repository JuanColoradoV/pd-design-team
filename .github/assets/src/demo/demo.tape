Output demo.mp4
Set Shell "bash"
Set FontSize 16
Set Width 1280
Set Height 820
Set Padding 28
Set TypingSpeed 45ms
Set Theme { "name": "pd", "background": "#0C0C0A", "foreground": "#F3F0E8", "cursor": "#FF5A26", "selection": "#2C2B26", "black": "#0C0C0A", "red": "#FF3E70", "green": "#C8F560", "yellow": "#FFB547", "blue": "#7AA2FF", "magenta": "#FF7AC6", "cyan": "#6FE3D6", "white": "#F3F0E8", "brightBlack": "#6D685C", "brightRed": "#FF5A26", "brightGreen": "#D8FF7A", "brightYellow": "#FFD27A", "brightBlue": "#A3BEFF", "brightMagenta": "#FFA3D9", "brightCyan": "#A3F0E8", "brightWhite": "#FFFFFF" }
Hide
Type "for v in $(env | grep -o '^CLAUDE[A-Z_]*'); do unset $v; done; export PS1='$ '; cd ~/Documents/Proyectos/streak-demo && clear"
Enter
Type `claude --model sonnet --permission-mode acceptEdits --strict-mcp-config --allowedTools "Read(~/.claude/**)" "Read(~/Documents/Proyectos/pd-design-team/**)" --disallowedTools "Bash" "WebFetch" "WebSearch" "Read(~/.claude/projects/**)" "Read(~/.claude/*.json)" "Read(~/.claude/.credentials*)" "Read(~/.claude/history*)" "Read(~/.claude/todos/**)" "Read(~/.claude/shell-snapshots/**)"`
Enter
Sleep 7s
Show
Sleep 1500ms
Type "Use pd-design-lead to plan the request in the README."
Sleep 600ms
Enter
Sleep 270s
Screenshot end.png
Sleep 4s
Hide
Ctrl+C
Ctrl+C
