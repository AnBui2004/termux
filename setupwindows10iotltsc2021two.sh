clear
echo -e '\e[1;37mInstalling packages...\e[0m'
sed -i '/setup121024/d' /etc/profile
apt update
apt upgrade -y
apt install pulseaudio tightvncserver qemu-system-x86 -y
export PULSE_SERVER=127.0.0.1
clear
echo -e '\e[1;37mJust a sec...\e[0m'
if [ -e "/storage/emulated/0/VM/W10IoTLTSC2021.qcow2" ]; then
    cd
    curl -o start102021.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/start102021.sh
    chmod +rwx start102021.sh
    echo '/root/start102021.sh' >> /etc/profile
    clear
    echo -e '\e[1;37mDone!\e[0m'
    echo -e '\e[1;37mUse this command to run: "./start102021.sh"\e[0m'
    echo -e '\e[1;37m----------\e[0m'
    echo -e '\e[1;37mThe necessary files are in the VM folder on your phone. Please do not delete the files there if you still use them.\e[0m'
else
    clear
    sed -i '/start102021/d' /etc/profile
    cd
    rm start102021vm.sh
    rm /storage/emulated/0/VM/W10IoTLTSC2021.qcow2
    rm start102021.sh
    echo -e "\e[0;33m--------------------"
    echo -e "\e[91mError! An error occurred. Please try again later."
fi
rm setup121024.sh
exit