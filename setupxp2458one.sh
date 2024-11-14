clear
setname='xp2458'
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
chmod +rwx /storage/emulated/0/VM
cd /storage/emulated/0/VM
wget -O a.7z http://192.168.1.111:8080/api/Windows%20XP%202458.7z
7z x a.7z
rm a.7z
cd
clear
echo -e '\e[1;37mInstalling Debian...\e[0m'
proot-distro install debian
clear
echo -e '\e[1;37mJust a sec...\e[0m'
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root
curl -o "setup"$setname".sh" https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setup"$setname"two.sh
chmod +rwx "setup"$setname".sh"
echo qemu-system-x86_64 -usb -device usb-tablet -device usb-kbd -cpu qemu32 -smp sockets=1,cores=1,threads=1 -m 512M -overcommit mem-lock=off -hda /storage/emulated/0/VM/XP2458.qcow2 -cdrom /storage/emulated/0/VM/5.1.2457.0.main.010309-1904_x86fre_client-home_retail_en-us-WB2PLFRE_EN.iso -vga std -device sb16 -device pcnet,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -rtc base=2001-03-10t00:00:00 -vnc :2 > "start"$setname"vm.sh"
chmod +rwx "start"$setname"vm.sh"
cd ../
echo "/root/setup"$setname".sh" >> ./etc/profile
cd
echo 'sed -i '/start"$setname"/d' /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/etc/profile' > "start"$setname".sh"
echo 'pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1 && echo '/root/start"$setname".sh' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/etc/profile' >> start"$setname".sh
echo 'proot-distro login debian' >> start"$setname".sh
chmod +rwx start"$setname".sh
clear
echo -e '\e[1;37mLogin to Debian...\e[0m'
proot-distro login debian
rm /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root/setup"$setname".sh