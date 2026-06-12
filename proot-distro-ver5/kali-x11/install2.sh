#Remove the initial setup.
chmod -x /etc/profile.d/installkali.sh
clear
echo -e '\e[1;37m[i] Installing packages...\e[0m'
#Update.
apt update
apt upgrade -y
#Install packages.
apt install sudo xterm thunar fluxbox firefox-esr pulseaudio -y
#Setup kaliroom.
useradd -m kaliroom
passwd -d kaliroom
usermod -s /bin/bash kaliroom
echo 'kaliroom ALL=(ALL) ALL' | tee /etc/sudoers.d/kaliroom
chmod 440 /etc/sudoers.d/kaliroom
#Done.
clear
echo -e '\e[1;37m[i] Done!\e[0m'
echo -e '\e[1;37m-\e[0m'
echo -e "\e[1;37mUse this command to run: \"./startkali.sh\"\e[0m"
echo -e '\e[1;37m-\e[0m'
rm /etc/profile.d/installkali.sh
rm /data/data/com.termux/files/home/installkali.sh