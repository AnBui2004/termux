clear
echo "The owner of these scripts will not be responsible for any unintended problems that may occur whether you edit these scripts or not. It will start in 10 seconds and you have agreed to this. To cancel press Ctrl + C."
sleep 10
clear
setname='77070'
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
wget -O a.7z https://archive.org/download/windows-7-7070.7znbabtermux/Windows%207%207070.7z
7z x a.7z
rm a.7z
cd
clear
echo -e '\e[1;37mInstalling Debian...\e[0m'
proot-distro install debian
clear
echo -e '\e[1;37mJust a sec...\e[0m'
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root
curl -o "setup"$setname".sh" https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupwindows"$setname"two.sh
chmod +rwx "setup"$setname".sh"
echo qemu-system-x86_64 -usb -device usb-tablet -device usb-kbd -cpu qemu64,+sse,+sse2,+sse4.1,+sse4.2 -smp sockets=1,cores=4,threads=1 -m 2048M -overcommit mem-lock=off -drive file=/storage/emulated/0/VM/W77070.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device intel-hda -device hda-duplex -device e1000,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -rtc base=2009-03-24t00:00:00 -vnc :2 > "start"$setname"vm.sh"
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
