clear
echo -e '\e[1;37mInstalling packages...\e[0m'
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
yes y | termux-setup-storage
fi
apt update
apt upgrade -y
apt install x11-repo -y
apt install proot-distro p7zip wget -y
clear
echo -e '\e[1;37mSetting up Pulseaudio...\e[0m'
curl -o setup.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/installpulseaudio.sh
chmod +rwx setup.sh
./setup.sh
rm setup.sh
clear
echo -e '\e[1;37mDownloading file...\e[0m'
mkdir /storage/emulated/0/VM
chmod +rwx /storage/emulated/0/VM
cd /storage/emulated/0/VM
wget -O a.7z http://192.168.1.111:8080/api/Windows%20XP%202502.7z
7z x a.7z
rm a.7z
cd
clear
echo -e '\e[1;37mInstalling Debian...\e[0m'
proot-distro install debian
clear
echo -e '\e[1;37mJust a sec...\e[0m'
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root
curl -o setup301024.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupwindowsxp2502two.sh
chmod +rwx setup301024.sh
echo qemu-system-x86_64 -usb -device usb-tablet -device usb-kbd -cpu qemu32 -smp sockets=1,cores=1,threads=1 -m 512M -overcommit mem-lock=off -hda /storage/emulated/0/VM/XP2502.qcow2 -vga std -device ac97 -device rtl8139,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -rtc base=2001-06-30t00:00:00 -vnc :2 > startxp2502vm.sh
chmod +rwx startxp2502vm.sh
cd ../
echo '/root/setup301024.sh' >> ./etc/profile
cd
echo 'sed -i '/startxp2502/d' /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/etc/profile' > startxp2502.sh
echo 'echo '/root/startxp2502.sh' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/etc/profile' >> startxp2502.sh
echo 'proot-distro login debian' >> startxp2502.sh
chmod +rwx startxp2502.sh
clear
echo -e '\e[1;37mLogin to Debian...\e[0m'
proot-distro login debian
rm /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root/setup301024.sh