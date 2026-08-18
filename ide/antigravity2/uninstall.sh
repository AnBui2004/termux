echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to uninstall Google Antigravity?"
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
        sed -i "/startantigravity.sh/d" $HOME/.profile
        rm -r $HOME/antigravity.sh
        sudo rm /root/antigravity.sh /data/data/com.termux/files/home/antigravity.sh
        sudo rm -r /Apps/IDE/Antigravity
        clear
        echo -e "\e[1;37m[i] Google Antigravity has been uninstalled."
        ;;
    '2')
        clear
        echo -e "\e[1;37m[i] Uninstalling Google Antigravity..."
        sed -i "/startantigravity.sh/d" $HOME/.profile
        rm -r $HOME/antigravity.sh $HOME/.antigravity 
        sudo rm /root/antigravity.sh /root/.antigravity /data/data/com.termux/files/home/antigravity.sh
        sudo rm -r /Apps/IDE/Antigravity
        clear
        echo -e "\e[1;37m[i] Google Antigravity has been uninstalled."
        ;;
    *)
        clear
        echo -e "\e[1;37mCancelling..."
        ;;
esac
clear