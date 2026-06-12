sed -i "/startkali.sh/d" ~/.profile
export PULSE_SERVER=127.0.0.1
pulseaudio --start --disable-shm=1 --exit-idle-time=-1
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity
termux-x11 -xstartup "fluxbox" &