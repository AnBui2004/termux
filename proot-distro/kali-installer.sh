clear
echo -e "\e[1;37m[!] Warning and do not ignore!"
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mPlease do not run any other commands when this setup begins. If you're running other commands, they haven't finished executing yet or don't want some packages to be forced to be updated when setting up, press Ctrl + C now to cancel the setup immediately."
echo -e "\e[1;37m\e[0m"
echo -e "\e[1;37mBy obtaining and running Kali Linux in any way, you agree to any Agreements and Policies provided by the vendor or owner of this operating system and other related things. You are responsible for any consequences that may arise from using Kali Linux. The owner of this script is not responsible for any consequences that may arise from using the virtual machine or you have edited these scripts. To disagree and cancel the setup, press Ctrl + C."
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mAutomatically go to next step after 60 seconds or continue immediately by pressing any key and you agree to the above."
if read -r -t 60 -n 1 _; then
    echo "Pressed the key and continued immediately."
else
    echo "60 seconds elapsed, auto continue."
fi
clear
echo -e '\e[1;37m[i] Installing packages...\e[0m'
apt update
yes y | apt upgrade -y
apt install x11-repo -y
apt install proot-distro -y
clear
echo -e '\e[1;37m[i] Installing Linux...\e[0m'
cd $PREFIX/etc/proot-distro
cp kali.sh kali.sh.old
curl -H 'Cache-Control: no-cache' -o kali.sh "https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/proot-distro/kali-2026-1.sh"
cd
proot-distro install kali
clear
if [ -d "$PREFIX/var/lib/proot-distro/installed-rootfs/kali/home" ]; then
    echo -e '\e[1;37m[i] Done!\e[0m'
    echo -e '\e[1;37m-\e[0m'
    echo -e "\e[1;37mUse this command to login: \"pd login kali\"\e[0m"
else
    echo -e '\e[1;37m[!] Failed!\e[0m'
    echo -e '\e[1;37m-\e[0m'
    echo -e "\e[1;37mSomething went wrong and Kali Linux is not installed. Please try again later.\e[0m"
fi
echo -e '\e[1;37m-\e[0m'