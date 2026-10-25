echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to uninstall Google Antigravity IDE?"
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37m1. Uninstall and RETAIN user settings data."
echo -e "\e[1;37m2. Uninstall and DO NOT RETAIN user settings data."
echo -e "\e[1;37mOther. Cancel"
echo -e "\e[1;37m--------------------"
read -n 1 option

case "$option" in
    '1')
        clear
        echo -e "\e[1;37m[i] Uninstalling Google Antigravity..."
        sed -i "/startantigravityide.sh/d" $HOME/.profile
        rm -rf $HOME/antigravityide.sh
        sudo rm -f /usr/local/bin/antigravityide /data/data/com.termux/files/usr/bin/antigravityide
        sudo rm -r /Apps/IDE/AntigravityIDE
        clear
        echo -e "\e[1;37m[i] Google Antigravity has been uninstalled."
        ;;
    '2')
        clear
        echo -e "\e[1;37m[i] Uninstalling Google Antigravity..."
        sed -i "/startantigravityide.sh/d" $HOME/.profile
        rm -rf $HOME/antigravityide.sh $HOME/.antigravity 
        sudo rm -f /usr/local/bin/antigravityide /data/data/com.termux/files/usr/bin/antigravityide
        sudo rm -r /Apps/IDE/AntigravityIDE
        clear
        echo -e "\e[1;37m[i] Google Antigravity IDE has been uninstalled."
        ;;
    *)
        clear
        echo -e "\e[1;37mCancelling..."
        ;;
esac
clear