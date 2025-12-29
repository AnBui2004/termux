echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to uninstall Android Studio?"
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37m1. Uninstall and RETAIN user settings data."
echo -e "\e[1;37m2. Uninstall and DO NOT RETAIN user settings data."
echo -e "\e[1;37mOther. Cancel"
echo -e "\e[1;37m--------------------"
read -n 1 option

case "$option" in
    '1')
        clear
        echo -e "\e[1;37m[i] Uninstalling Android Studio..."
        sed -i "/startstudio.sh/d" $HOME/.profile
        rm -r $HOME/studio.sh $HOME/.gradle $HOME/Android
        sudo rm /root/studio.sh /data/data/com.termux/files/home/studio.sh
        sudo rm -r /Apps/IDE/android-studio
        clear
        echo -e "\e[1;37m[i] Android Studio has been uninstalled."
        ;;
    '2')
        clear
        echo -e "\e[1;37m[i] Uninstalling Android Studio..."
        sed -i "/startstudio.sh/d" $HOME/.profile
        rm -r $HOME/studio.sh $HOME/.android $HOME/.gradle $HOME/Android
        sudo rm /root/studio.sh /root/.studio /data/data/com.termux/files/home/studio.sh
        sudo rm -r /Apps/IDE/android-studio
        clear
        echo -e "\e[1;37m[i] Android Studio has been uninstalled."
        ;;
    *)
        clear
        echo -e "\e[1;37mCancelling..."
        ;;
esac
clear