clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mWarning: Please do not run any other commands when this setup begins. If you're running other commands and they haven't finished executing yet, press Ctrl + C now to cancel the setup immediately."
echo -e "\e[1;37m--------------------"
sleep 5
clear
source ./setup1.sh
echo -e '\e[1;37mInstalling packages...\e[0m'
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
yes y | termux-setup-storage
fi
apt update
apt upgrade -y
apt install x11-repo -y
apt install proot-distro p7zip wget pulseaudio -y
clear
echo -e '\e[1;37mSetting up Pulseaudio...\e[0m'
export PULSE_SERVER=127.0.0.1
clear
echo -e '\e[1;37mDownloading file...\e[0m'
mkdir /storage/emulated/0/VM
mkdir /storage/emulated/0/VM/$setname
chmod +rwx /storage/emulated/0/VM
chmod +rwx /storage/emulated/0/VM/$setname
if [ ! -d "/storage/emulated/0/VM/Shared" ]; then
    mkdir /storage/emulated/0/VM
    chmod +rwx /storage/emulated/0/VM/Shared
fi
if [ ! -e "/storage/emulated/0/VM/"$setname"/"$diskfilename"" ]; then
    cd /storage/emulated/0/VM/$setname
    wget $setfileurl
    7z x $setname.7z
    rm $setname.7z
    cd
fi
clear
echo -e '\e[1;37mInstalling Debian...\e[0m'
proot-distro install debian
clear
echo -e '\e[1;37mJust a sec...\e[0m'
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root
curl -o "setup"$setname".sh" https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupqemu/setupqemuvm2.sh
chmod +rwx "setup"$setname".sh"
sed -i -e "1idiskfilename="$diskfilename"" setup"$setname".sh
sed -i -e "1isetname="$setname"" setup"$setname".sh
sed -i -e "1iosname="$osname"" setup"$setname".sh
echo $setqemucommand > "start"$setname"vm.sh"
echo $setqemucommand > "start"$setname"vms.sh"
echo -n " -drive file=fat:rw:/storage/emulated/0/VM/Shared" >> "start"$setname"vms.sh"
chmod +rwx "start"$setname"vm.sh"
chmod +rwx "start"$setname"vms.sh"
cd ../
echo "/root/setup"$setname".sh" >> ./etc/profile
cd
echo 'sed -i '/start"$setname"/d' /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/etc/profile' > "start"$setname".sh"
echo 'pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1' >> start"$setname".sh
echo ''/root/start"$setname".sh' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/etc/profile' >> start"$setname".sh
echo 'proot-distro login debian' >> start"$setname".sh
chmod +rwx start"$setname".sh
clear
echo -e '\e[1;37mLogin to Debian...\e[0m'
proot-distro login debian
rm /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root/setup"$setname".sh