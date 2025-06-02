clear
echo "The owner of these scripts will not be responsible for any unintended problems that may occur whether you edit these scripts or not. It will start in 10 seconds and you have agreed to this. To cancel press Ctrl + C."
sleep 10
clear
echo -e '\e[1;37mUpdating packages...\e[0m'
apt update
apt upgrade -y
clear
echo -e '\e[1;37mInstalling packages...\e[0m'
pkg install x11-repo -y
pkg install termux-am termux-tools pulseaudio wget qemu-system-x86_64 -y
clear
echo -e '\e[1;37mInstalling libraries...\e[0m'
pkg install libdw alsa-plugins jack2 -y
clear
echo -e '\e[1;37mDo you want to grant Termux access to your storage?\e[0m'
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
yes y | termux-setup-storage
fi
sleep 3
export PULSE_SERVER=127.0.0.1
clear
echo -e '\e[1;37mDone!\e[0m'
