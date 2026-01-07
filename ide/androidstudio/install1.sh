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
echo -e "\e[1;37mMake sure you have at least 10 GB of free storage on your device. Please do not run any other commands when this setup begins. If you're running other commands, they haven't finished executing yet or don't want some packages to be forced to be updated when setting up, press Ctrl + C now to cancel the setup immediately."
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
echo -e '\e[1;37m[i] Downloading Android Studio...\e[0m'
cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian
mkdir -p Apps/IDE
cd Apps/IDE
aria2c -x 4 -o studio.tar.gz https://edgedl.me.gvt1.com/edgedl/android/studio/ide-zips/2024.2.2.15/android-studio-2024.2.2.15-linux.tar.gz
clear
echo -e '\e[1;37m[i] Installing Android Studio...\e[0m'
tar -xvzf studio.tar.gz
rm studio.tar.gz
cd android-studio
mv jbr jbr.bak
cat > studio.sh <<'EOF'
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity && \
termux-x11 -xstartup "bash -c 'fluxbox & thunar & STUDIO_JDK=/usr/lib/jvm/java-21-openjdk-arm64 && /Apps/IDE/android-studio/bin/studio.sh && sleep infinity'"
EOF
aria2c -o startstudio.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/androidstudio/startstudio.sh
aria2c -o uninstall.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/androidstudio/uninstall.sh
chmod +x bin/studio
chmod +x bin/studio.sh
chmod +x studio.sh
chmod +x startstudio.sh
chmod +x uninstall.sh
clear
echo -e '\e[1;37m[i] Just a sec...\e[0m'
mkdir -p $PREFIX/var/lib/proot-distro/installed-rootfs/debian/home/devroom
cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/etc/profile.d
aria2c -o installstudio.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/androidstudio/install2.sh
chmod +x installstudio.sh
cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root
echo "sed -i \"/startstudio.sh/d\" /home/devroom/.profile" > "studio.sh"
echo "echo "/Apps/IDE/android-studio/startstudio.sh" >> /home/devroom/.profile" >> studio.sh
echo "clear" >> studio.sh
echo "su - devroom" >> studio.sh
echo "clear" >> studio.sh
chmod +x studio.sh
cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/home/devroom
echo "/Apps/IDE/android-studio/startstudio.sh" > studio.sh
chmod +x studio.sh
cd
echo "sed -i \"/startstudio.sh/d\" $PREFIX/var/lib/proot-distro/installed-rootfs/debian/home/devroom/.profile" > "studio.sh"
echo "echo '/Apps/IDE/android-studio/startstudio.sh' >> $PREFIX/var/lib/proot-distro/installed-rootfs/debian/home/devroom/.profile" >> studio.sh
echo "clear" >> studio.sh
echo "proot-distro login debian --user devroom" >> studio.sh
echo "clear" >> studio.sh
chmod +x studio.sh
clear
echo -e '\e[1;37m[i] Logging in...\e[0m'
proot-distro login debian
rm installstudio.sh
clear