PROCESSES_INFO=$(ps -e -u devroom)
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity
if [[ "$PROCESSES_INFO" =~ "fluxbox" || "$PROCESSES_INFO" =~ "antigravity-ide" ]]; then
    /Apps/IDE/AntigravityIDE/antigravity-ide --no-sandbox
else
    termux-x11 -xstartup "bash -c 'fluxbox & thunar & /Apps/IDE/AntigravityIDE/antigravity-ide --no-sandbox && sleep infinity'"
fi