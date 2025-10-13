clear
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
    echo -e "\e[1;37m[!] Please grant access to storage!"
    yes y | termux-setup-storage
    echo -e "\e[1;37m[i] Automatically go to next step after 5 seconds."
    sleep 5
fi
clear
echo -e "\e[1;37m[!] Warning and do not ignore!"
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mPlease do not run any other commands when this setup begins. If you're running other commands, they haven't finished executing yet or don't want some packages to be forced to be updated when setting up, press Ctrl + C now to cancel the setup immediately."
echo -e "\e[1;37m\e[0m"
echo -e "\e[1;37mBy using Ubuntu in any way, you agree to their terms.. The owner of this script is not responsible for any consequences that may arise from using the virtual machine or you have edited these scripts. To disagree and cancel the setup, press Ctrl + C."
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mPress any key to continue."
read -n 1 -s -r
clear
echo -e '\e[1;37m[i] Installing packages...\e[0m'
apt update
yes y | apt upgrade -y
apt install x11-repo -y
apt install proot-distro termux-x11 pulseaudio -y
clear
echo -e '\e[1;37m[i] Installing Ubuntu...\e[0m'
proot-distro install ubuntu
clear
echo -e '\e[1;37m[i] Just a sec...\e[0m'
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root
echo "clear && sed -i \"/startsetup.sh/d\" /etc/profile && export PULSE_SERVER=127.0.0.1 && apt update && apt upgrade -y && apt install lxde firefox fastfetch pulseaudio thunar -y && rm -rf startsetup.sh" > startsetup.sh
echo "clear" >> startsetup.sh
echo "[i] Done!" >> startsetup.sh
echo "---" >> startsetup.sh
echo "Run this command to start: ./startubuntu.sh" >> startsetup.sh
chmod +rwx startsetup.sh
echo "am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity" > startdisplay.sh
echo "export PULSE_SERVER=127.0.0.1 && termux-x11 :0 -xstartup \"startlxde\"" >> startdisplay.sh
chmod +rwx startdisplay.sh
echo "./startdisplay.sh" > "startubuntu.sh"
chmod +rwx startubuntu.sh
cd
echo "sed -i \"/startdisplay/d\" /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/etc/profile" > "startubuntu.sh"
echo 'pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1' >> startubuntu.sh
echo "echo '/root/startdisplay.sh' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/etc/profile" >> startubuntu.sh
echo "proot-distro login ubuntu" >> startubuntu.sh
chmod +rwx startubuntu.sh
echo "/root/startsetup.sh" | tee -a /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/etc/profile > /dev/null
clear
echo -e '\e[1;37m[i] Logging into Ubuntu...\e[0m'
proot-distro login ubuntu
rm quicksetupubuntu.sh
rm /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/startsetup.sh
clear