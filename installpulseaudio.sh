apt update
apt upgrade -y
pkg install x11-repo -y
pkg install pulseaudio -y
export PULSE_SERVER=127.0.0.1
echo pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1 > sound.sh
chmod +rwx sound.sh
./sound.sh
clear
echo -e '\e[1;37mDone!\e[0m'
echo -e '\e[1;37mIf the Termux process was stopped before and you reopen Termux or it does not work, run this command: "./sound.sh".\e[0m'
