apt update
apt upgrade -y
pkg install x11-repo -y
pkg install pulseaudio -y
export PULSE_SERVER=127.0.0.1
curl -o sound.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/runpulseaudio.sh
chmod +rwx sound.sh
./sound.sh
sed -i '/sound.sh/d' /data/data/com.termux/files/usr/etc/bash.bashrc
echo /data/data/com.termux/files/home/sound.sh >> /data/data/com.termux/files/usr/etc/bash.bashrc
clear
echo -e '\e[1;37mDone!\e[0m'
echo -e '\e[1;37mIf it does not work, run this command: "./sound.sh".\e[0m'
