if [ -z "$PREFIX" ]; then
    PREFIX=/data/data/com.termux/files/usr
fi
if [ -z "$DEBUG_IDE_INSTALLER" ]; then
    clear
fi
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
    echo -e "\e[1;37m[!] You should grant access to storage on this device."
    yes y | termux-setup-storage
    if [ -z "$DEBUG_IDE_INSTALLER" ]; then
        clear
    fi
    echo -e "\e[1;37m[i] Automatically go to next step after 5 seconds."
    sleep 5
fi
if [ -z "$DEBUG_IDE_INSTALLER" ]; then
    clear
fi
echo -e "\e[1;37m[!] Warning and do not ignore!"
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mMake sure you have at least 4 GB of free storage on your device. Please do not run any other commands when this setup begins. If you're running other commands, they haven't finished executing yet or don't want some packages to be forced to be updated when setting up, press Ctrl + C now to cancel the setup immediately."
echo -e "\e[1;37m\e[0m"
echo -e "\e[1;37mAutomatically go to next step after 60 seconds or continue immediately by pressing any key and you agree to the above."
if read -r -t 60 -n 1 _; then
    echo "Pressed the key and continued immediately."
else
    echo "60 seconds elapsed, auto continue."
fi
if [ -z "$DEBUG_IDE_INSTALLER" ]; then
    clear
fi
cd
echo -e '\e[1;37m[i] Installing packages...\e[0m'
apt update
yes y | apt upgrade -y
apt install x11-repo -y
apt install proot-distro aria2 termux-x11 -y
if [ -z "$DEBUG_IDE_INSTALLER" ]; then
    clear
fi
echo -e '\e[1;37m[i] Installing Debian...\e[0m'
proot-distro install debian -n debiandevroom
if [ -z "$DEBUG_IDE_INSTALLER" ]; then
    clear
fi
echo -e '\e[1;37m[i] Downloading Google Antigravity IDE...\e[0m'
cd $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs
mkdir -p Apps/IDE
cd Apps/IDE
architecture=$(uname -m)
if [[ "$architecture" =~ "aarch64" ]]; then
    aria2c -x 4 -o Antigravity.tar.gz https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/2.5.5-4923483625488384/linux-arm/Antigravity%20IDE.tar.gz
elif [[ "$architecture" =~ "x86_64" ]]; then
    aria2c -x 4 -o Antigravity.tar.gz https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/2.5.5-4923483625488384/linux-x64/Antigravity%20IDE.tar.gz
else
    rm -f installantigravity.sh
    if [ -z "$DEBUG_IDE_INSTALLER" ]; then
        clear
    fi
    echo -e "\e[1;37m[!] Cannot install!"
    echo -e "\e[1;37m-\e[0m"
    echo -e "\e[1;37mAntigravity does not support 32-bit operating systems."
    echo -e "\e[1;37m\e[0m"
    exit
fi
if [ -z "$DEBUG_IDE_INSTALLER" ]; then
    clear
fi
echo -e '\e[1;37m[i] Installing Google Antigravity IDE...\e[0m'
tar -xvzf Antigravity.tar.gz
rm Antigravity.tar.gz
mv "Antigravity IDE" AntigravityIDE
cd AntigravityIDE
aria2c -o antigravityide.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/antigravityide202610/antigravityide.sh
aria2c -o startantigravityide.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/antigravityide202610/startantigravity.sh
aria2c -o uninstall.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/antigravityide202610/uninstall.sh
chmod +x startantigravityide.sh
chmod +x antigravityide.sh
chmod +x uninstall.sh
if [ -z "$DEBUG_IDE_INSTALLER" ]; then
    clear
fi
echo -e '\e[1;37m[i] Just a sec...\e[0m'
mkdir -p $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs/home/devroom
cd $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs/etc/profile.d
aria2c -o installantigravity.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/antigravityide202610/install2.sh
sed -i -e "1iDEBUG_IDE_INSTALLER=$DEBUG_IDE_INSTALLER" installantigravity.sh
sed -i -e "1iPREFIX=$PREFIX" installantigravity.sh
chmod +x installantigravity.sh
cd
aria2c -o antigravityide https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/ide/antigravityide202610/startwrapper.sh
cp antigravityide $PREFIX/bin
chmod +x $PREFIX/bin/antigravityide
mkdir -p $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs/usr/local/bin
mv antigravityide $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs/usr/local/bin
if [ -z "$DEBUG_IDE_INSTALLER" ]; then
    clear
fi
echo -e '\e[1;37m[i] Logging in...\e[0m'
proot-distro login debiandevroom
rm -f $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs/etc/profile.d/installantigravity.sh
rm -f installantigravity.sh
if [ -z "$DEBUG_IDE_INSTALLER" ]; then
    clear
fi