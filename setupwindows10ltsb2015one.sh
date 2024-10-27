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
wget -O a.7z 'https://www.googleapis.com/drive/v3/files/1cPRmI8CS3xVO_z4WGxSe5ftTuY6-Kwj7?alt=media&key=AIzaSyBg5cJ4QZF7kDgco9Sxrs-cPtV3F65bVSY'
7z x a.7z
rm a.7z
cd
clear
echo -e '\e[1;37mInstalling Debian...\e[0m'
proot-distro install debian
clear
echo -e '\e[1;37mJust a sec...\e[0m'
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root
curl -o setup261024.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupwindows10ltsb2015two.sh
chmod +rwx setup261024.sh
echo qemu-system-x86_64 -M q35 -usb -device usb-tablet -device usb-kbd -cpu qemu64,+avx,+avx2,+sse,+sse2,+sse4.1,+sse4.2 -smp sockets=1,cores=4,threads=1 -m 2048M -overcommit mem-lock=off -drive file=/storage/emulated/0/VM/w10ltsb2015.vhd,aio=threads,cache=unsafe,if=virtio -device qxl-vga,vgamem_mb=128 -device intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -device intel-iommu -vnc :2 > startltsb2015vm.sh
chmod +rwx startltsb2015vm.sh
cd ../
echo '/root/setup261024.sh' >> ./etc/profile
cd
echo 'sed -i '/startltsb2015/d' /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/etc/profile' > startltsb2015.sh
echo 'echo '/root/startltsb2015.sh' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/etc/profile' >> startltsb2015.sh
echo 'proot-distro login debian' >> startltsb2015.sh
chmod +rwx startltsb2015.sh
clear
echo -e '\e[1;37mLogin to Debian...\e[0m'
proot-distro login debian
rm /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root/setup261024.sh
