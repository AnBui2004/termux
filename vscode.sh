clear
echo -e '\e[1;37mUpdating packages...\e[0m'
apt update
apt upgrade -y
clear
echo -e '\e[1;37mInstalling packages...\e[0m'
apt install wget xterm fluxbox tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer thunar -y
clear
echo -e '\e[1;37mDownloading vscode...\e[0m'
wget -O vscode.deb https://vscode.download.prss.microsoft.com/dbazure/download/stable/5437499feb04f7a586f677b155b039bc2b3669eb/code_1.90.2-1718750608_arm64.deb
clear
echo -e '\e[1;37mInstalling vscode...\e[0m'
dpkg -i vscode.deb
chmod +rwx vscode.deb
rm vscode.deb
clear
echo -e '\e[1;37mJust a moment...\e[0m'
apt-get --fix-missing install -y
apt --fix-broken install -y
mkdir /home
mkdir /home/ann
mkdir /home/ann/code
chmod +rwx /home/ann/code
wget -O code.sh https://raw.githubusercontent.com/AnBui2004/termux/main/startvscode.sh
chmod +rwx code.sh
clear
echo -e '\e[1;37mSetup VNC Server\e[0m'
vncpasswd
clear
echo -e '\e[1;37mDone!\e[0m'
echo -e '\e[1;37mUse this command to start vscode: "./code.sh"\e[0m'