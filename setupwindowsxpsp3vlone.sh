clear
echo "The owner of these scripts will not be responsible for any unintended problems that may occur whether you edit these scripts or not. It will start in 10 seconds and you have agreed to this. To cancel press Ctrl + C."
sleep 10
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
wget -O a.7z https://archive.org/download/windows-xp-sp-3-vl.-7z_202411nbabtermux/Windows%20XP%20SP3%20VL.7z
7z x a.7z
rm a.7z
cd
clear
echo -e '\e[1;37mInstalling Debian...\e[0m'
proot-distro install debian
clear
echo -e '\e[1;37mJust a sec...\e[0m'
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root
curl -o setup151024.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupwindowsxpsp3vltwo.sh
chmod +rwx setup151024.sh
echo qemu-system-x86_64 -usb -device usb-tablet -device usb-kbd -cpu qemu32,+sse,+sse2,+sse4.1,+sse4.2 -smp sockets=1,cores=1,threads=1 -m 512M -overcommit mem-lock=off -hda /storage/emulated/0/VM/XPSP3VL.qcow2 -device vmware-svga,vgamem_mb=128 -device ac97 -device rtl8139,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -vnc :2 > startxpx86vm.sh
chmod +rwx startxpx86vm.sh
cd ../
echo '/root/setup151024.sh' >> ./etc/profile
cd
echo 'sed -i '/startxpx86/d' /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/etc/profile' > startxpx86.sh
echo 'echo '/root/startxpx86.sh' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/etc/profile' >> startxpx86.sh
echo 'proot-distro login debian' >> startxpx86.sh
chmod +rwx startxpx86.sh
clear
echo -e '\e[1;37mLogin to Debian...\e[0m'
proot-distro login debian
rm /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root/setup151024.sh
