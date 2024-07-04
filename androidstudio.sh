clear
echo -e '\e[1;37mUpdating packages...\e[0m'
apt update
apt upgrade -y
clear
echo -e '\e[1;37mInstalling packages...\e[0m'
apt install python3 pip default-jdk wget xterm fluxbox tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer thunar -y
clear
echo -e '\e[1;37mDownloading Android Studio...\e[0m'
wget -O studio.tar.gz https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2024.1.1.11/android-studio-2024.1.1.11-linux.tar.gz
clear
echo -e '\e[1;37mInstalling Android Studio...\e[0m'
tar -xvzf studio.tar.gz
rm studio.tar.gz
clear
echo -e '\e[1;37mJust a moment...\e[0m'
apt-get --fix-missing install -y
apt --fix-broken install -y
wget -O studio.sh https://raw.githubusercontent.com/AnBui2004/termux/main/startandroidstudio.sh
chmod +rwx studio.sh
clear
echo -e '\e[1;37mSetup VNC Server\e[0m'
vncpasswd
clear
echo -e '\e[1;37mDone!\e[0m'
echo -e '\e[1;37mUse this command to start Android Studio: "./studio.sh"\e[0m'
echo -e '\e[1;37mUse this command to browse files: "thunar"\e[0m'
echo -e '\e[1;33m----------\e[0m'
echo -e '\e[1;33mIf error=2 occurs for Gradle, go to File > Settings > Build, Execution, Deployment > Build Tools > Gradle. In Gradle JDK, select /usr/lib/vm/default-java xx.x.xx - aarch64.\e[0m'
echo -e '\e[1;33m----------\e[0m'