clear
setname='lh6k'
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
wget -O a.7z https://www.googleapis.com/drive/v3/files/1P5HwoRP5bNhVNY7q-iR_28rst84V-PC2?alt=media&key=AIzaSyBg5cJ4QZF7kDgco9Sxrs-cPtV3F65bVSY
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
echo 'qemu-system-x86_64 -usb -device usb-tablet -device usb-kbd -cpu qemu64,+avx,+avx2,+sse,+sse2,+sse4.1,+sse4.2,hv-relaxed -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 2048M,slots=4,maxmem=2049M -object memory-backend-ram,size=512M,id=m0 -numa node,nodeid=0,memdev=m0,cpus=0 -object memory-backend-ram,size=512M,id=m1 -numa node,nodeid=1,memdev=m1,cpus=1 -object memory-backend-ram,size=512M,id=m2 -numa node,nodeid=2,memdev=m2,cpus=2 -object memory-backend-ram,size=512M,id=m3 -numa node,nodeid=3,memdev=m3,cpus=3 -drive file=/storage/emulated/0/VM/lh6k.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device ac97 -device e1000,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -vnc :2' > "start"$setname"vm.sh"
chmod +rwx "start"$setname"vm.sh"
cd ../
echo "/root/setup"$setname".sh" >> ./etc/profile
cd
echo 'sed -i '/start"$setname"/d' /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/etc/profile' > "start"$setname".sh"
echo 'pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1' >> start"$setname".sh
echo 'echo '/root/start"$setname".sh' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/etc/profile' >> start"$setname".sh
echo 'proot-distro login debian' >> start"$setname".sh
chmod +rwx start"$setname".sh
clear
echo -e '\e[1;37mLogin to Debian...\e[0m'
proot-distro login debian
rm /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root/setup"$setname".sh
