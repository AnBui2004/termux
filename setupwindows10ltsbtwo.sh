clear
echo -e '\e[1;37mInstalling packages...\e[0m'
sed -i '/setup261024/d' /etc/profile
apt update
apt upgrade -y
apt install pulseaudio tightvncserver qemu-system-x86 -y
export PULSE_SERVER=127.0.0.1
clear
echo -e '\e[1;37mJust a sec...\e[0m'
if [ -e "/storage/emulated/0/VM/w10ltsb2015.vhd" ]; then
    cd
    curl -o startltsb2015.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/startltsb2015.sh
    chmod +rwx startltsb2015.sh
    echo '/root/startltsb2015.sh' >> /etc/profile
    clear
    echo -e '\e[1;37mDone!\e[0m'
    echo -e '\e[1;37mUse this command to run: "./startltsb2015.sh"\e[0m'
    echo -e '\e[1;37m----------\e[0m'
    echo -e '\e[1;37mThe necessary files are in the VM folder on your phone. Please do not delete the files there if you still use them.\e[0m'
else
    clear
    sed -i '/startltsb2015/d' /etc/profile
    cd
    rm startltsb2015vm.sh
    rm /storage/emulated/0/VM/w10ltsb2015.vhd
    rm startltsb2015.sh
    rm /data/data/com.termux/files/home/startltsb2015.sh
    echo -e "\e[0;33m--------------------"
    echo -e "\e[91mError! An error occurred. Please try again later."
fi
rm setup261024.sh
exit