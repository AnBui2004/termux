clear
echo -e '\e[1;37mInstalling packages...\e[0m'
curl -o installqemu.sh https://raw.githubusercontent.com/AnBui2004/termux/main/installqemu.sh
chmod +rwx installqemu.sh
./installqemu.sh
rm installqemu.sh
pkg install p7zip -y
clear
echo -e '\e[1;37mDownloading file...\e[0m'
wget -O a.7z https://archive.org/download/react-os.-7z_20240831/ReactOS.7z
7z x a.7z
mkdir /storage/emulated/0/VM
chmod +rwx /storage/emulated/0/VM
mv ReactOS.qcow2 /storage/emulated/0/VM
rm a.7z
clear
echo -e '\e[1;37mJust a moment...\e[0m'
echo qemu-system-x86_64 -cpu core2duo,+avx -smp sockets=1,cores=4,threads=1 -m 512M -hda /storage/emulated/0/VM/ReactOS.qcow2 -vga std -device e1000,netdev=n0 -netdev user,id=n0 -usb -device usb-tablet -device usb-kbd -device ac97 -accel tcg,thread=multi,tb-size=2048 -vnc :2 > startreactos.sh
chmod +rwx startreactos.sh
clear
echo -e '\e[1;37mDone!\e[0m'
echo -e '\e[1;37mUse this command to run: "./startreactos.sh"\e[0m'
echo -e '\e[1;37m----------\e[0m'
echo -e '\e[1;37mThe necessary files are in the VM folder on your phone. Please do not delete the files there if you still use them.\e[0m'