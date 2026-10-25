chmod -x /etc/profile.d/installantigravity.sh
if [ -z "$DEBUG_IDE_INSTALLER" ]; then
    clear
fi
echo -e '\e[1;37m[i] Installing packages...\e[0m'
chmod 755 /usr/local/bin/antigravityide
apt update
apt upgrade -y
apt install sudo curl xterm thunar fluxbox aria2 firefox-esr libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcurl3-gnutls libcurl4 libdbus-1-3 libexpat1 libgbm1 libglib2.0-0 libgtk-3-0 libgtk-4-1 libnspr4 libnss3 libpango-1.0-0 libx11-6 libxcb1 libxcomposite1 libxdamage1 libxext6 libxfixes3 libxkbcommon0 libxkbfile1 libxrandr2 xdg-utils -y
chmod 755 /usr/local/bin/antigravitycli
useradd -m devroom
passwd -d devroom
usermod -s /bin/bash devroom
echo 'devroom ALL=(ALL) ALL' | tee /etc/sudoers.d/devroom
chmod 440 /etc/sudoers.d/devroom
if [ ! -z "$PREFIX" ]; then
    cd $PREFIX
    cd ../home
    rm -f installantigravity.sh
    cd
else
    rm -f /data/data/com.termux/files/home/installantigravity.sh
fi
if [ -z "$DEBUG_IDE_INSTALLER" ]; then
    clear
fi
echo -e '\e[1;37m[i] Done!\e[0m'
echo -e '\e[1;37m-\e[0m'
echo -e "\e[1;37mUse this command to run: \"antigravityide\"\e[0m"
echo -e '\e[1;37m-\e[0m'
rm -f /etc/profile.d/installantigravity.sh