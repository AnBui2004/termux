sed -i "/installvscode.sh/d" /etc/profile
clear
echo -e '\e[1;37m[i] Installing packages...\e[0m'
apt update
apt upgrade -y
apt install xterm thunar fluxbox aria2 libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcurl3-gnutls libcurl4 libdbus-1-3 libexpat1 libgbm1 libglib2.0-0 libgtk-3-0 libgtk-4-1 libnspr4 libnss3 libpango-1.0-0 libx11-6 libxcb1 libxcomposite1 libxdamage1 libxext6 libxfixes3 libxkbcommon0 libxkbfile1 libxrandr2 xdg-utils -y
clear
echo -e '\e[1;37m[i] Downloading Visual Studio Code...\e[0m'
aria2c -x 4 -o vscode.tar.gz https://vscode.download.prss.microsoft.com/dbazure/download/stable/618725e67565b290ba4da6fe2d29f8fa1d4e3622/code-stable-arm64-1765353456.tar.gz
clear
echo -e '\e[1;37m[i] Installing Visual Studio Code...\e[0m'
tar -xvzf vscode.tar.gz
chmod +rwx VSCode-linux-arm64/bin/code
chmod +rwx VSCode-linux-arm64/bin/code-tunnel
echo "am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity && termux-x11 -xstartup \"xterm -e bash -c 'thunar & VSCode-linux-arm64/bin/code --no-sandbox --user-data-dir /root/code\"'" > code.sh
chmod +rwx code.sh
mkdir -p /root/code
clear
echo -e '\e[1;37m[i] Done!\e[0m'
echo -e '\e[1;37m-\e[0m'
echo -e "\e[1;37mUse this command to run: \"./startvscode.sh\"\e[0m"
echo -e '\e[1;37m-\e[0m'
rm installvscode.sh
rm "/data/data/com.termux/files/home/installvscode.sh"