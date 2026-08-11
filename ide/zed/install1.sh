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
proot-distro install debian -n debiandevroom
clear
echo -e '\e[1;37m[i] Downloading Zed...\e[0m'
cd $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs
mkdir -p Apps/IDE
cd Apps/IDE
aria2c -x 4 -o zed.tar.gz https://github.com/zed-industries/zed/releases/download/v1.14.2/zed-linux-aarch64.tar.gz
clear
echo -e '\e[1;37m[i] Installing Zed...\e[0m'
tar -xvzf zed.tar.gz
rm zed.tar.gz
cd zed.app
cat > zed.sh <<'EOF'
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity && \
termux-x11 -xstartup "bash -c 'nohup fluxbox & nohup thunar & export ZED_ALLOW_EMULATED_GPU=1 && nohup /Apps/IDE/zed.app/bin/zed'"
EOF
aria2c -o startzed.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/zed/startzed.sh
aria2c -o uninstall.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/zed/uninstall.sh
chmod +x zed.sh
chmod +x startzed.sh
chmod +x uninstall.sh
clear
echo -e '\e[1;37m[i] Just a sec...\e[0m'
mkdir -p $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs/home/devroom
cd $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs/etc/profile.d
aria2c -o installzed.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/zed/install2.sh
chmod +x installzed.sh
cd $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs/root
echo "sed -i \"/startzed.sh/d\" /home/devroom/.profile" > "zed.sh"
echo "echo "/Apps/IDE/zed.app/zed.sh" >> /home/devroom/.profile" >> zed.sh
echo "clear" >> zed.sh
echo "su - devroom" >> zed.sh
echo "clear" >> zed.sh
chmod +x zed.sh
cd $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs/home/devroom
echo "/Apps/IDE/zed.app/startzed.sh" > zed.sh
chmod +x zed.sh
cd
echo "sed -i \"/startzed.sh/d\" $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs/home/devroom/.profile" > "zed.sh"
echo "echo '/Apps/IDE/zed.app/startzed.sh' >> $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs/home/devroom/.profile" >> zed.sh
echo "clear" >> zed.sh
echo "proot-distro login debiandevroom --user devroom" >> zed.sh
echo "clear" >> zed.sh
chmod +x zed.sh
clear
echo -e '\e[1;37m[i] Logging in...\e[0m'
proot-distro login debiandevroom
rm installzed.sh
clear