apt update
apt upgrade -y
pkg install x11-repo -y
pkg install pulseaudio -y
export PULSE_SERVER=127.0.0.1
curl -o sound.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/runpulseaudio.sh
chmod +rwx sound.sh
./sound.sh
clear
echo -e '\e[1;37mDone!\e[0m'
echo -e '\e[1;37mIf the Termux process was stopped before and you reopen Termux or it does not work, run this command: "./sound.sh".\e[0m'
