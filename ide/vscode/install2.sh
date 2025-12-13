sed -i "/installvscode.sh/d" /etc/profile
clear
echo -e '\e[1;37m[i] Installing packages...\e[0m'
apt update
apt upgrade -y
apt install xterm thunar fluxbox aria2 libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcurl3-gnutls libcurl4 libdbus-1-3 libexpat1 libgbm1 libglib2.0-0 libgtk-3-0 libgtk-4-1 libnspr4 libnss3 libpango-1.0-0 libx11-6 libxcb1 libxcomposite1 libxdamage1 libxext6 libxfixes3 libxkbcommon0 libxkbfile1 libxrandr2 xdg-utils -y
clear
echo -e '\e[1;37m[i] Done!\e[0m'
echo -e '\e[1;37m-\e[0m'
echo -e "\e[1;37mUse this command to run: \"./startvscode.sh\"\e[0m"
echo -e '\e[1;37m-\e[0m'
rm installvscode.sh
rm "/data/data/com.termux/files/home/installvscode.sh"