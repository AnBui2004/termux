chmod -x /etc/profile.d/installstudio.sh
clear
echo -e '\e[1;37m[i] Installing packages...\e[0m'
apt update
apt upgrade -y
apt install sudo xterm thunar fluxbox default-jdk -y
useradd -m devroom
passwd -d devroom
usermod -s /bin/bash devroom
echo 'devroom ALL=(ALL) ALL' | tee /etc/sudoers.d/devroom
chmod 440 /etc/sudoers.d/devroom
clear
echo -e '\e[1;37m[i] Done!\e[0m'
echo -e '\e[1;37m-\e[0m'
echo -e "\e[1;37mUse this command to run: \"./studio.sh\"\e[0m"
echo -e '\e[1;37m-\e[0m'
rm /etc/profile.d/installstudio.sh
rm /data/data/com.termux/files/home/installstudio.sh