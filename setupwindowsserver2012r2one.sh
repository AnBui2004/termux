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
wget -O a.7z https://archive.org/download/windows-server-2012-r-2.7znbabtermux/Windows%20Server%202012%20R2.7z
7z x a.7z
rm a.7z
cd
clear
echo -e '\e[1;37mInstalling Debian...\e[0m'
proot-distro install debian
clear
echo -e '\e[1;37mJust a sec...\e[0m'
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root
curl -o setup231024.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupwindowsserver2012r2two.sh
chmod +rwx setup231024.sh
echo qemu-system-x86_64 -M q35 -usb -device usb-tablet -device usb-kbd -cpu Haswell,+avx,+avx2,+sse,+sse2,+sse4.1,+sse4.2,+pae -smp sockets=1,cores=4,threads=1 -m 4096M -overcommit mem-lock=off -drive file=/storage/emulated/0/VM/ws2012r2.qcow2,aio=threads,cache=unsafe,if=virtio -vga std -device intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -device intel-iommu -vnc :2 > startw2012vm.sh
chmod +rwx startw2012vm.sh
cd ../
echo '/root/setup231024.sh' >> ./etc/profile
cd
echo 'sed -i '/startw2012/d' /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/etc/profile' > startw2012.sh
echo 'echo '/root/startw2012.sh' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/etc/profile' >> startw2012.sh
echo 'proot-distro login debian' >> startw2012.sh
chmod +rwx startw2012.sh
clear
echo -e '\e[1;37mLogin to Debian...\e[0m'
proot-distro login debian
rm /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root/setup231024.sh
