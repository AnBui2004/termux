clear
echo -e '\e[1;37mUpdating packages...\e[0m'
apt update
apt upgrade -y
clear
echo -e '\e[1;37mInstalling packages...\e[0m'
apt install python3 pip wget xterm fluxbox tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer thunar -y
clear
echo -e '\e[1;37mDownloading pycharm...\e[0m'
wget -O pycharm.tar.gz https://download-cdn.jetbrains.com/python/pycharm-professional-2024.1.4-aarch64.tar.gz
clear
echo -e '\e[1;37mInstalling vscode...\e[0m'
tar -xvzf pycharm.tar.gz
rm pycharm.tar.gz
clear
echo -e '\e[1;37mJust a moment...\e[0m'
apt-get --fix-missing install -y
apt --fix-broken install -y
wget -O pycharm.sh https://raw.githubusercontent.com/AnBui2004/termux/main/startpycharm.sh
chmod +rwx pycharm.sh
clear
echo -e '\e[1;37mSetup VNC Server\e[0m'
vncpasswd
clear
echo -e '\e[1;37mDone!\e[0m'
echo -e '\e[1;37mUse this command to start PyCharm: "./pycharm.sh"\e[0m'
echo -e '\e[1;37mUse this command to browse files: "thunar"\e[0m'
