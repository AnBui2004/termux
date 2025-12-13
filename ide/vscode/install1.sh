clear
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
    echo -e "\e[1;37m[!] You should grant access to storage on this device."
    yes y | termux-setup-storage
    echo -e "\e[1;37m[i] Automatically go to next step after 5 seconds."
    sleep 5
fi
clear
echo -e "\e[1;37m[!] Warning and do not ignore!"
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mPlease do not run any other commands when this setup begins. If you're running other commands, they haven't finished executing yet or don't want some packages to be forced to be updated when setting up, press Ctrl + C now to cancel the setup immediately."
echo -e "\e[1;37m\e[0m"
echo -e "\e[1;37mAutomatically go to next step after 60 seconds or continue immediately by pressing any key and you agree to the above."
if read -r -t 60 -n 1 _; then
    echo "Pressed the key and continued immediately."
else
    echo "60 seconds elapsed, auto continue."
fi
clear
echo -e '\e[1;37m[i] Installing packages...\e[0m'
apt update
yes y | apt upgrade -y
apt install x11-repo -y
apt install proot-distro aria2 termux-x11 -y
echo -e '\e[1;37m[i] Installing Linux...\e[0m'
proot-distro install debian
echo -e '\e[1;37m[i] Just a sec...\e[0m'
cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root
aria2c -o installvscode.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/vscode/install2.sh
chmod +rwx installvscode.sh
cd
echo "sed -i \"/startvscode.sh/d\" $PREFIX/var/lib/proot-distro/installed-rootfs/debian/etc/profile" > "startvscode.sh"
echo "echo '/root/startvscode.sh' >> $PREFIX/var/lib/proot-distro/installed-rootfs/debian/etc/profile" >> startvscode.sh
echo "proot-distro login debian" >> startvscode.sh
chmod +rwx startvscode.sh
sed -i "/installvscode.sh/d" $PREFIX/var/lib/proot-distro/installed-rootfs/debian/etc/profile
echo "/root/installvscode.sh" >> $PREFIX/var/lib/proot-distro/installed-rootfs/debian/etc/profile
clear
echo -e '\e[1;37m[i] Logging in...\e[0m'
proot-distro login debian
rm installvscode.sh
clear