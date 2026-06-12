chmod -x /etc/profile.d/installkali.sh
clear
echo -e '\e[1;37m[i] Installing packages...\e[0m'
apt update
apt upgrade -y
apt install sudo xterm thunar fluxbox firefox-esr -y
useradd -m kaliroom
passwd -d kaliroom
usermod -s /bin/bash kaliroom
echo 'kaliroom ALL=(ALL) ALL' | tee /etc/sudoers.d/kaliroom
chmod 440 /etc/sudoers.d/kaliroom
sed -i "/PULSE_SERVER=/d" /home/kaliroom/.profile
sed -i "/pulseaudio/d" /home/kaliroom/.profile
echo "export PULSE_SERVER=127.0.0.1" >> /home/kaliroom/.profile
echo "pulseaudio --start --disable-shm=1 --exit-idle-time=-1" >> /home/kaliroom/.profile
clear
echo -e '\e[1;37m[i] Done!\e[0m'
echo -e '\e[1;37m-\e[0m'
echo -e "\e[1;37mUse this command to run: \"./startkali.sh\"\e[0m"
echo -e '\e[1;37m-\e[0m'
rm /etc/profile.d/installkali.sh
rm /data/data/com.termux/files/home/installkali.sh