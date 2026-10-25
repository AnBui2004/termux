sed -i "/startantigravityide.sh/d" $HOME/.profile
clear
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
echo -e "\e[1;37m[!] You should grant access to storage on this device."
echo -e "\e[1;37m--------------------"
fi
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to run Google Antigravity IDE now? Enter the corresponding number and press enter to start. Enter nothing and press enter to exit and continue using Debian."
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37m1. Run now"
echo -e "\e[1;37m2. Uninstall"
echo -e "\e[1;37mOther. Exit"
echo -e "\e[1;37m--------------------"
read -n 1 option

case "$option" in
    '1')
        clear
        echo -e "\e[1;37m[i] Google Antigravity IDE is starting..."
        /Apps/IDE/AntigravityIDE/antigravityide.sh
        /Apps/IDE/AntigravityIDE/startantigravityide.sh
        ;;
    '2')
        /Apps/IDE/Antigravity/uninstall.sh
        ;;
    *)
        clear
        echo -e "\e[1;37mExiting..."
        ;;
esac
clear