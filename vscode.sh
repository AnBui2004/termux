clear
echo -e '\e[1;37mUpdating packages...\e[0m'
apt update
apt upgrade -y
clear
echo -e '\e[1;37mInstalling Wget...\e[0m'
apt install wget -y
clear
echo -e '\e[1;37mDownloading vscode...\e[0m'
wget -O vscode.deb https://vscode.download.prss.microsoft.com/dbazure/download/stable/5437499feb04f7a586f677b155b039bc2b3669eb/code_1.90.2-1718750608_arm64.deb
clear
echo -e '\e[1;37mInstalling vscode...\e[0m'
dpkg -i vscode.deb
clear
echo -e '\e[1;37mJust a moment...\e[0m'
apt-get --fix-missing install
clear
echo -e '\e[1;37mDone!\e[0m'
echo -e '\e[1;37mUse this command to start vscode: "code --no-sandbox"\e[0m'
echo -e '\e[91mNote: vscode does not work in root user, please create another user to use vscode.'