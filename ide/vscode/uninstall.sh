echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to uninstall Visual Studio Code?"
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37m1. Uninstall and RETAIN user settings data."
echo -e "\e[1;37m2. Uninstall and DO NOT RETAIN user settings data."
echo -e "\e[1;37mOther. Cancel"
echo -e "\e[1;37m--------------------"
read -n 1 option

case "$option" in
    '1')
        clear
        echo -e "\e[1;37m[i] Uninstalling Visual Studio Code..."
        rm -r /etc/profile.d/startvscode.sh $HOME/code.sh /data/data/com.termux/files/home/code.sh /Apps/IDE/VSCode-linux-arm64
        clear
        echo -e "\e[1;37m[i] Visual Studio Code has been uninstalled."
        ;;
    '2')
        clear
        echo -e "\e[1;37m[i] Uninstalling Visual Studio Code..."
        rm -r /etc/profile.d/startvscode.sh $HOME/code.sh $HOME/.vscode /data/data/com.termux/files/home/code.sh /Apps/IDE/VSCode-linux-arm64
        clear
        echo -e "\e[1;37m[i] Visual Studio Code has been uninstalled."
        ;;
    *)
        clear
        echo -e "\e[1;37mCancelling..."
        ;;
esac
clear