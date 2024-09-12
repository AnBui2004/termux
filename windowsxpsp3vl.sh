clear
echo -e '\e[1;37mInstalling packages...\e[0m'
curl -o installqemu.sh https://raw.githubusercontent.com/AnBui2004/termux/main/installqemu.sh
chmod +rwx installqemu.sh
./installqemu.sh
rm installqemu.sh
pkg install p7zip -y
clear
echo -e '\e[1;37mDownloading file...\e[0m'
wget -O a.7z http://192.168.1.111:8080/api/Windows%20XP%20SP3%20VL.7z
7z x a.7z
mkdir /storage/emulated/0/VM
chmod +rwx /storage/emulated/0/VM
mv XPSP3VL.qcow2 /storage/emulated/0/VM
rm a.7z
clear
echo -e '\e[1;37mJust a moment...\e[0m'
echo qemu-system-x86_64 -usb -device usb-tablet -device usb-kbd -cpu qemu32 -smp sockets=1,cores=1,threads=1 -m 512M -drive file=/storage/emulated/0/VM/XPSP3VL.qcow2,aio=threads,cache=unsafe -device vmware-svga,vgamem_mb=128 -device ac97 -device rtl8139,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -vnc :2 > startxpx86.sh
chmod +rwx startxpx86.sh
clear
echo -e '\e[1;37mDone!\e[0m'
echo -e '\e[1;37mUse this command to run: "./startxpx86.sh"\e[0m'
echo -e '\e[1;37m----------\e[0m'
echo -e '\e[1;37mThe necessary files are in the VM folder on your phone. Please do not delete the files there if you still use them.\e[0m'
