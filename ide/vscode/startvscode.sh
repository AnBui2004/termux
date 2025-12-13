clear
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
echo -e "\e[1;37m[!] You should grant access to storage on this device."
echo -e "\e[1;37m--------------------"
fi
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to run Visual Studio Code now? Enter the corresponding number and press enter to start. Enter nothing and press enter to exit and continue using Debian."
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37m1. Run now"
echo -e "\e[1;37m2. Uninstall"
echo -e "\e[1;37mOther. Exit"
echo -e "\e[1;37m--------------------"
read -n 1 vmoption

case "$vmoption" in
    '1')
        cd
        clear
        echo -e "\e[1;37m[i] Visual Studio Code is running..."
        /Apps/IDE/VSCode-linux-arm64/code.sh
        clear
        ./startvscode.sh
        clear
        ;;
    '2')
        cd
        clear
        echo -e "\e[1;37m[i] Uninstalling Visual Studio Code..."
        rm -r Apps/IDE/VSCode-linux-arm64 /etc/profile.d/startvscode.sh startvscode.sh /data/data/com.termux/files/home/startvscode.sh
        clear
        echo -e "\e[1;37m[i] Visual Studio Code has been uninstalled."
        ;;
    *)
        echo -e "\e[1;37mExiting..."
        clear
        ;;
esac
cd $PREFIX/var/lib/proot-distro/installed-rootfs/debian/etc/profile.d
mv startvscode.sh startvscode.sh.disabled
cd