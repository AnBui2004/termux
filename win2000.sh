clear
echo -e '\e[1;37mInstalling packages...\e[0m'
curl -o installqemu.sh https://raw.githubusercontent.com/AnBui2004/termux/main/installqemu.sh
chmod +rwx installqemu.sh
./installqemu.sh
rm installqemu.sh
pkg install unzip -y
clear
echo -e '\e[1;37mDownloading file...\e[0m'
wget -O a.7z http://192.168.1.111:8080/api/Windows%202000.zip
unzip a.7z
mkdir /storage/emulated/0/VM
chmod +rwx /storage/emulated/0/VM
mv 2000.img /storage/emulated/0/VM
rm a.7z
clear
echo -e '\e[1;37mJust a moment...\e[0m'
echo qemu-system-x86_64 -cpu qemu32 -smp sockets=1,cores=1,threads=1 -m 256M -hda /storage/emulated/0/VM/2000.img -vga cirrus -device ac97 -device ne2k_pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -vnc :2 > start2000.sh
chmod +rwx start2000.sh
clear
echo -e '\e[1;37mDone!\e[0m'
echo -e '\e[1;37mUse this command to run: "./start2000.sh"\e[0m'
echo -e '\e[1;37m----------\e[0m'
echo -e '\e[1;37mThe necessary files are in the VM folder on your phone. Please do not delete the files there if you still use them.\e[0m'
