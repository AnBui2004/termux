clear
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
    echo -e "\e[1;37m[!] You should grant access to storage on this device."
    yes y | termux-setup-storage
    clear
    echo -e "\e[1;37m[i] Automatically go to next step after 5 seconds."
    sleep 5
fi
clear
echo -e "\e[1;37m[!] Warning and do not ignore!"
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mMake sure you have at least 16 GB of free storage on your device. Please do not run any other commands when this setup begins. If you're running other commands, they haven't finished executing yet or don't want some packages to be forced to be updated when setting up, press Ctrl + C now to cancel the setup immediately."
echo -e "\e[1;37m\e[0m"
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
apt install proot-distro termux-x11 -y
clear
echo -e '\e[1;37m[i] Installing Linux...\e[0m'
cd $PREFIX/etc/proot-distro
cp kali.sh kali.sh.old
curl -H 'Cache-Control: no-cache' -o kali.sh "https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/proot-distro/kali-2026-1.sh"
cd
proot-distro install kali
clear
echo -e '\e[1;37m[i] Just a sec...\e[0m'
mkdir -p $PREFIX/var/lib/proot-distro/installed-rootfs/kali/home/kaliroom
cd $PREFIX/var/lib/proot-distro/installed-rootfs/kali/etc/profile.d
aria2c -o installkali.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/proot-distro/kali-x11/install2.sh
chmod +x installkali.sh
cd $PREFIX/var/lib/proot-distro/installed-rootfs/kali/root
echo "sed -i \"/com.termux.x11/d\" /home/kaliroom/.profile" > "startkali.sh"
echo "sed -i \"/termux-x11/d\" /home/kaliroom/.profile" ?\>> "startkali.sh"
echo 'echo "am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity" >> /home/kaliroom/.profile' >> startkali.sh
echo 'echo "termux-x11 -xstartup "fluxbox" &" >> /home/kaliroom/.profile' >> startkali.sh
echo "clear" >> startkali.sh
echo "su - kaliroom" >> startkali.sh
echo "clear" >> startkali.sh
chmod +x startkali.sh
cd
echo "sed -i \"/termux-x11/d\" $PREFIX/var/lib/proot-distro/installed-rootfs/kali/home/kaliroom/.profile" > "startkali.sh"
echo "sed -i \"/com.termux.x11/d\" $PREFIX/var/lib/proot-distro/installed-rootfs/kali/home/kaliroom/.profile" >> "startkali.sh"
echo "am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity" >> startkali.sh
echo "echo 'termux-x11 -xstartup \"fluxbox\" &' >> $PREFIX/var/lib/proot-distro/installed-rootfs/kali/home/kaliroom/.profile" >> startkali.sh
echo "clear" >> startkali.sh
echo "proot-distro login kali --user kaliroom" >> startkali.sh
echo "clear" >> startkali.sh
chmod +x startkali.sh
clear
echo -e '\e[1;37m[i] Logging in...\e[0m'
proot-distro login kali
rm installkali.sh
clear