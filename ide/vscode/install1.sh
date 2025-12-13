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
clear
echo -e '\e[1;37m[i] Installing Linux...\e[0m'
proot-distro install debian
clear
echo -e '\e[1;37m[i] Downloading Visual Studio Code...\e[0m'
cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian
mkdir -p Apps/IDE
cd Apps/IDE
aria2c -x 4 -o vscode.tar.gz https://vscode.download.prss.microsoft.com/dbazure/download/stable/618725e67565b290ba4da6fe2d29f8fa1d4e3622/code-stable-arm64-1765353456.tar.gz
clear
echo -e '\e[1;37m[i] Installing Visual Studio Code...\e[0m'
tar -xvzf vscode.tar.gz
rm vscode.tar.gz
cd VSCode-linux-arm64
cat > code.sh <<'EOF'
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity && \
termux-x11 -xstartup "bash -c 'fluxbox & thunar & /Apps/IDE/VSCode-linux-arm64/bin/code --no-sandbox && sleep infinity'"
EOF
aria2c -o startvscode.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/vscode/startvscode.sh
aria2c -o startvscode.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/vscode/uninstall.sh
chmod +x bin/code
chmod +x bin/code-tunnel
chmod +x code.sh
chmod +x startvscode.sh
chmod +x uninstall.sh
clear
echo -e '\e[1;37m[i] Just a sec...\e[0m'
mkdir -p $PREFIX/var/lib/proot-distro/installed-rootfs/debian/home/devroom
cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/etc/profile.d
aria2c -o installvscode.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/vscode/install2.sh
chmod +x installvscode.sh
cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/root
echo "sed -i \"/startvscode.sh/d\" /home/devroom/.profile" > "code.sh"
echo "echo "/Apps/IDE/VSCode-linux-arm64/startvscode.sh" >> /home/devroom/.profile" >> code.sh
echo "login devroom" >> code.sh
chmod +x code.sh
cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/home/devroom
echo "/Apps/IDE/VSCode-linux-arm64/startvscode.sh" > code.sh
chmod +x code.sh
cd
echo "sed -i \"/startvscode.sh/d\" $PREFIX/var/lib/proot-distro/installed-rootfs/debian/home/devroom/.profile" > "code.sh"
echo "echo '/Apps/IDE/VSCode-linux-arm64/startvscode.sh' >> $PREFIX/var/lib/proot-distro/installed-rootfs/debian/home/devroom/.profile" >> code.sh
echo "proot-distro login debian --user devroom" >> code.sh
echo "clear" >> code.sh
chmod +x code.sh
clear
echo -e '\e[1;37m[i] Logging in...\e[0m'
proot-distro login debian
rm installvscode.sh
clear