clear
echo "The owner of these scripts will not be responsible for any unintended problems that may occur whether you edit these scripts or not. It will start in 10 seconds and you have agreed to this. To cancel press Ctrl + C."
sleep 10
clear
echo -e '\e[1;37mUpdating packages...\e[0m'
apt update
apt upgrade -y
clear
echo -e '\e[1;37mInstalling packages...\e[0m'
apt install gcc g++ wget xterm fluxbox tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer thunar -y
clear
echo -e '\e[1;37mDownloading clion...\e[0m'
wget -O clion.tar.gz https://download-cdn.jetbrains.com/cpp/CLion-2024.2.0.1-aarch64.tar.gz
clear
echo -e '\e[1;37mInstalling clion...\e[0m'
tar -xvzf clion.tar.gz
rm clion.tar.gz
clear
echo -e '\e[1;37mJust a moment...\e[0m'
apt-get --fix-missing install -y
apt --fix-broken install -y
wget -O clion.sh https://raw.githubusercontent.com/AnBui2004/termux/main/startclion.sh
chmod +rwx clion.sh
clear
echo -e '\e[1;37mSetup VNC Server\e[0m'
vncpasswd
clear
echo -e '\e[1;37mDone!\e[0m'
echo -e '\e[1;37mUse this command to start CLion: "./clion.sh"\e[0m'
echo -e '\e[1;37mUse this command to browse files: "thunar"\e[0m'
