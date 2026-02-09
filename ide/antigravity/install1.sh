clear
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
    echo -e "\e[1;37m[!] You should grant access to storage on this device."
    yes y | termux-setup-storage
    clear
    echo -e "\e[1;37m[i] Automatically go to next step after 5 seconds."
    sleep 5
fi
clear
echo -e "\e[1;37m[!] Warning and do not ignore!"
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mMake sure you have at least 4 GB of free storage on your device. Please do not run any other commands when this setup begins. If you're running other commands, they haven't finished executing yet or don't want some packages to be forced to be updated when setting up, press Ctrl + C now to cancel the setup immediately."
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
clear
echo -e '\e[1;37m[i] Installing Linux...\e[0m'
proot-distro install debian
clear
echo -e '\e[1;37m[i] Downloading Google Antigravity...\e[0m'
cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian
mkdir -p Apps/IDE
cd Apps/IDE
aria2c -x 4 -o Antigravity.tar.gz https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/1.16.5-6703236727046144/linux-arm/Antigravity.tar.gz
clear
echo -e '\e[1;37m[i] Installing Google Antigravity...\e[0m'
tar -xvzf Antigravity.tar.gz
rm Antigravity.tar.gz
cd Antigravity
cat > antigravity.sh <<'EOF'
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity && \
termux-x11 -xstartup "bash -c 'fluxbox & thunar & /Apps/IDE/Antigravity/bin/antigravity --no-sandbox && sleep infinity'"
EOF
aria2c -o startantigravity.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/antigravity/startantigravity.sh
aria2c -o uninstall.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/antigravity/uninstall.sh
chmod +x bin/antigravity
chmod +x startantigravity.sh
chmod +x antigravity.sh
chmod +x uninstall.sh
clear
echo -e '\e[1;37m[i] Just a sec...\e[0m'
mkdir -p $PREFIX/var/lib/proot-distro/installed-rootfs/debian/home/devroom
cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/etc/profile.d
aria2c -o installantigravity.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/antigravity/install2.sh
chmod +x installantigravity.sh
cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root
echo "sed -i \"/startantigravity.sh/d\" /home/devroom/.profile" > "antigravity.sh"
echo "echo "/Apps/IDE/Antigravity/startantigravity.sh" >> /home/devroom/.profile" >> antigravity.sh
echo "clear" >> antigravity.sh
echo "su - devroom" >> antigravity.sh
echo "clear" >> antigravity.sh
chmod +x antigravity.sh
cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/home/devroom
echo "/Apps/IDE/Antigravity/startantigravity.sh" > antigravity.sh
chmod +x antigravity.sh
cd
echo "sed -i \"/startantigravity.sh/d\" $PREFIX/var/lib/proot-distro/installed-rootfs/debian/home/devroom/.profile" > "antigravity.sh"
echo "echo '/Apps/IDE/Antigravity/startantigravity.sh' >> $PREFIX/var/lib/proot-distro/installed-rootfs/debian/home/devroom/.profile" >> antigravity.sh
echo "clear" >> antigravity.sh
echo "proot-distro login debian --user devroom" >> antigravity.sh
echo "clear" >> antigravity.sh
chmod +x antigravity.sh
clear
echo -e '\e[1;37m[i] Logging in...\e[0m'
proot-distro login debian
rm installantigravity.sh
clear