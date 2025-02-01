apt update
apt upgrade -y
pkg install x11-repo -y
pkg install termux-am termux-tools pulseaudio wget qemu-system-x86_64 -y
pkg install libdw alsa-plugins jack2 -y
termux-setup-storage
export PULSE_SERVER=127.0.0.1
