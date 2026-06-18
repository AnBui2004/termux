clear
architecture=$(uname -m)
if [[ ! "$architecture" =~ "64" ]]; then
    rm -f setup1.sh
    clear
    echo -e "\e[1;37m[!] Unsupported architecture!"
    echo -e "\e[1;37m-\e[0m"
    echo -e "\e[1;37mAlpine only supports ARM 64-bit architecture. Your device's architecture is not supported."
    echo -e "\e[1;37m-\e[0m"
    echo -e "\e[1;37mSetup was canceled."
    exit
fi
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
    echo -e "\e[1;37m[!] Please grant access to storage!"
    yes y | termux-setup-storage
    echo -e "\e[1;37m[i] Automatically go to next step after 5 seconds."
    sleep 5
fi
clear
echo -e "\e[1;37m[!] Warning and do not ignore!"
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mPlease do not run any other commands when this setup begins. If you're running other commands, they haven't finished executing yet or don't want some packages to be forced to be updated when setting up, press Ctrl + C now to cancel the setup immediately."
echo -e "\e[1;37m\e[0m"
echo -e "\e[1;37mBy obtaining and running the virtual machine in any way, you agree to any Agreements and Policies provided by the vendor or owner of this operating system and other related things. You are responsible for any consequences that may arise from using the virtual machine. The owner of this script is not responsible for any consequences that may arise from using the virtual machine or you have edited these scripts. To disagree and cancel the setup, press Ctrl + C."
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mAutomatically go to next step after 60 seconds or continue immediately by pressing any key and you agree to the above."
if read -r -t 60 -n 1 _; then
    echo "Pressed the key and continued immediately."
else
    echo "60 seconds elapsed, auto continue."
fi
clear

setname='ipod1g'

echo -e '\e[1;37m[i] Installing packages...\e[0m'
apt update
yes y | apt upgrade -y
apt install x11-repo -y
apt install proot-distro wget pulseaudio aria2 tar unzip -y
clear
echo -e '\e[1;37m[i] Setting up Pulseaudio...\e[0m'
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
pactl load-module module-aaudio-sink
clear
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
    clear
    echo -e "\e[1;37m[!] Canceled!"
    echo -e "\e[1;37m-\e[0m"
    echo -e "\e[1;37mSetup was canceled because you did not grant Termux access to storage."
    echo -e "\e[1;37m-\e[0m"
    rm "setup1.sh"
    rm "setup2.sh"
    exit
fi
mkdir /storage/emulated/0/VM
mkdir /storage/emulated/0/VM/$setname
chmod +rwx /storage/emulated/0/VM
chmod +rwx /storage/emulated/0/VM/$setname
clear
echo -e '\e[1;37m[i] Downloading files...\e[0m'
cd /storage/emulated/0/VM/$setname
rm bootrom_s5l8900
rm iboot_204_n45ap.bin
rm nor_n45ap.bin
rm -r nand
aria2c -x 4 https://github.com/devos50/qemu-ios/releases/download/n45ap_v1/bootrom_s5l8900
if [ -e "bootrom_s5l8900.aria2" ]; then
    echo -e '\e[1;37m[!] Error!\e[0m'
    echo -e '\e[1;37m--\e[0m'
    echo -e '\e[1;37mDownload failed. Please try again later.\e[0m'
    rm -r ./*
    cd
    exit
fi
aria2c -x 4 https://github.com/devos50/qemu-ios/releases/download/n45ap_v1/iboot_204_n45ap.bin
if [ -e "iboot_204_n45ap.bin.aria2" ]; then
    echo -e '\e[1;37m[!] Error!\e[0m'
    echo -e '\e[1;37m--\e[0m'
    echo -e '\e[1;37mDownload failed. Please try again later.\e[0m'
    rm -r ./*
    cd
    exit
fi
aria2c -x 4 https://github.com/devos50/qemu-ios/releases/download/n45ap_v1/nor_n45ap.bin
if [ -e "nor_n45ap.bin.aria2" ]; then
    echo -e '\e[1;37m[!] Error!\e[0m'
    echo -e '\e[1;37m--\e[0m'
    echo -e '\e[1;37mDownload failed. Please try again later.\e[0m'
    rm -r ./*
    cd
    exit
fi
clear
echo -e '\e[1;37m[i] Downloading nand...\e[0m'
cd
mv $setname-temp $setname-temp-bak
mkdir $setname-temp
cd $setname-temp
aria2c -x 4 https://github.com/devos50/qemu-ios/releases/download/n45ap_v1/nand_n45ap.zip
if [ -e "nand_n45ap.zip.aria2" ]; then
    echo -e '\e[1;37m[!] Error!\e[0m'
    echo -e '\e[1;37m--\e[0m'
    echo -e '\e[1;37mDownload failed. Please try again later.\e[0m'
    rm -r ./*
    cd
    rm $setname-temp
    exit
fi
unzip nand_n45ap.zip
mv nand /storage/emulated/0/VM/$setname
cd
rm -r $setname-temp
clear
echo -e '\e[1;37m[i] Installing Linux...\e[0m'
proot-distro install debian:11 --name debian11
clear
echo -e '\e[1;37m[i] Downloading QEMU...\e[0m'
if [ ! -e ""$PREFIX"/var/lib/proot-distro/containers/debian11/rootfs/usr/local/bin/qemu-system-arm-aipt1g" ]; then
    cd $PREFIX/var/lib/proot-distro/containers/debian11/rootfs/root
    aria2c -x 4 -o qemu-system.tar.gz http://192.168.1.188/linux/package/debian/11/qemu/qemu-system-arm-aipt1g_6.2.50_debian11_aarch64.tar.gz
    if [ -e "qemu-system.tar.gz.aria2" ]; then
        echo -e '\e[1;37m[!] Error!\e[0m'
        echo -e '\e[1;37m--\e[0m'
        echo -e '\e[1;37mDownload failed. Please try again later.\e[0m'
        rm -r ./qemu-system*
        cd
        exit
    fi
    cd
fi
if [ ! -d ""$PREFIX"/var/lib/proot-distro/containers/debian11/rootfs/usr/local/share/qemu/keymaps" ]; then
    cd $PREFIX/var/lib/proot-distro/containers/debian11/rootfs/root
    aria2c -x 4 -o qemu-tools.tar.gz http://192.168.1.188/linux/package/debian/11/qemu/qemu-tools_6.2.50_debian11_aarch64.tar.gz
    if [ -e "qemu-tools.tar.gz.aria2" ]; then
        echo -e '\e[1;37m[!] Error!\e[0m'
        echo -e '\e[1;37m--\e[0m'
        echo -e '\e[1;37mDownload failed. Please try again later.\e[0m'
        rm -r ./qemu-tools*
        cd
        exit
    fi
    cd
fi
clear
echo -e '\e[1;37m[i] Just a sec...\e[0m'
cd $PREFIX/var/lib/proot-distro/containers/debian11/rootfs/root
curl -o "setup"$setname".sh" https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupqemu/v2/ipod/1g/setupqemuvm2.sh
chmod +rwx "setup"$setname".sh"
setqemucommand='qemu-system-arm-aipt1g -M iPod-Touch,bootrom=/sdcard/VM/ipod1g/bootrom_s5l8900,iboot=/sdcard/VM/ipod1g/iboot_204_n45ap.bin,nand=/sdcard/VM/ipod1g/nand -serial mon:stdio -cpu max -m 1G -d unimp -pflash /sdcard/VM/ipod1g/nor_n45ap.bin -accel tcg,thread=single,tb-size=2048 -monitor vc -vnc :2'
echo $setqemucommand > "start"$setname"vm.sh"
chmod +rwx "start"$setname"vm.sh"
cd ../
echo "/root/setup"$setname".sh" >> ./etc/profile
cd
echo "sed -i \"/start"$setname"/d\" $PREFIX/var/lib/proot-distro/containers/debian11/rootfs/etc/profile" > "start"$setname".sh"
echo 'pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1' >> start"$setname".sh
echo 'pactl load-module module-aaudio-sink' >> start"$setname".sh
echo "echo '/root/start"$setname".sh' >> $PREFIX/var/lib/proot-distro/containers/debian11/rootfs/etc/profile" >> start"$setname".sh
echo "proot-distro login debian11" >> start"$setname".sh
chmod +rwx start"$setname".sh
clear
echo -e '\e[1;37m[i] Logging in...\e[0m'
proot-distro login debian11
rm $PREFIX/var/lib/proot-distro/containers/debian11/rootfs/root/setup"$setname".sh
