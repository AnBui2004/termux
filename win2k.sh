clear
echo -e '\e[1;37mInstalling packages...\e[0m'
curl -o installqemu.sh https://raw.githubusercontent.com/AnBui2004/termux/main/installqemu.sh
chmod +rwx installqemu.sh
./installqemu.sh
rm installqemu.sh
pkg install p7zip -y
clear
echo -e '\e[1;37mDownloading file...\e[0m'
wget -O a.7z https://archive.org/download/windows-2000.7z_202408/Windows%202000.7z
7z x a.7z
mkdir /storage/emulated/0/VM
chmod +rwx /storage/emulated/0/VM
mv 2000.qcow2 /storage/emulated/0/VM
rm a.7z
clear
echo -e '\e[1;37mJust a moment...\e[0m'
echo qemu-system-x86_64 -cpu pentium3 -drive file=/storage/emulated/0/VM/2000.qcow2 -smp sockets=1,cores=1,threads=1 -m 128M -vga cirrus -device ne2k_pci,netdev=n0 -netdev user,id=n0 -device ac97 -usb -device usb-mouse -device usb-kbd -accel tcg,thread=multi,tb-size=2048 -vnc :2 > start2k.sh
chmod +rwx start2k.sh
clear
echo -e '\e[1;37mDone!\e[0m'
echo -e '\e[1;37mUse this command to run: "./start2k.sh"\e[0m'
echo -e '\e[1;37m----------\e[0m'
echo -e '\e[1;37mThe necessary files are in the VM folder on your phone. Please do not delete the files there if you still use them.\e[0m'