echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to uninstall Zed?"
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37m1. Uninstall"
echo -e "\e[1;37mOther. Cancel"
echo -e "\e[1;37m--------------------"
read -n 1 option

case "$option" in
    '1')
        clear
        echo -e "\e[1;37m[i] Uninstalling Zed..."
        sed -i "/startzed.sh/d" $HOME/.profile
        rm -r $HOME/zed.sh
        sudo rm /root/zed.sh /data/data/com.termux/files/home/zed.sh
        sudo rm -r /Apps/IDE/zed.app
        clear
        echo -e "\e[1;37m[i] Zed has been uninstalled."
        ;;
    *)
        clear
        echo -e "\e[1;37mCancelling..."
        ;;
esac
clear