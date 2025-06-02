clear
echo "The owner of these scripts will not be responsible for any unintended problems that may occur whether you edit these scripts or not. It will start in 10 seconds and you have agreed to this. To cancel press Ctrl + C."
sleep 10
clear
echo -e '\e[1;37mUpdating packages...\e[0m'
apt update
apt upgrade -y
clear
echo -e '\e[1;37mInstalling packages...\e[0m'
apt install wget xterm fluxbox tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer thunar -y
clear
echo -e '\e[1;37mDownloading idea...\e[0m'
wget -O idea.tar.gz https://download-cdn.jetbrains.com/idea/ideaIU-2024.1.4-aarch64.tar.gz
clear
echo -e '\e[1;37mInstalling idea...\e[0m'
tar -xvzf idea.tar.gz
rm idea.tar.gz
clear
echo -e '\e[1;37mJust a moment...\e[0m'
apt-get --fix-missing install -y
apt --fix-broken install -y
wget -O idea.sh https://raw.githubusercontent.com/AnBui2004/termux/main/startidea.sh
chmod +rwx idea.sh
clear
echo -e '\e[1;37mSetup VNC Server\e[0m'
vncpasswd
clear
echo -e '\e[1;37mDone!\e[0m'
echo -e '\e[1;37mUse this command to start IntelliJ IDEA: "./idea.sh"\e[0m'
echo -e '\e[1;37mUse this command to browse files: "thunar"\e[0m'
