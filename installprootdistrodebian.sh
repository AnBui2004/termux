clear
echo -e '\e[1;37mUpdating packages...\e[0m'
apt update
apt upgrade -y
clear
echo -e '\e[1;37mInstalling packages...\e[0m'
pkg install x11-repo termux-am termux-tools -y
clear
echo -e '\e[1;37mPlease allow Termux access to storage...\e[0m'
termux-setup-storage
clear
echo -e '\e[1;37mInstalling proot-distro ...\e[0m'
pkg install proot-distro -y
clear
echo -e '\e[1;37mInstalling Debian...\e[0m'
proot-distro install debian
clear
echo -e '\e[1;37mLogging in to Debian...\e[0m'
proot-distro login debian