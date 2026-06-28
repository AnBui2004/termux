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
clear
echo -e "\e[1;37m[!] Warning and do not ignore!"
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mPlease do not run any other commands when this setup begins. If you're running other commands, they haven't finished executing yet or don't want some packages to be forced to be updated when setting up, press Ctrl + C now to cancel the setup immediately."
echo -e "\e[1;37m\e[0m"
echo -e "\e[1;37mBy obtaining and running the virtual machine in any way, you agree to any Agreements and Policies provided by the vendor or owner of this operating system and other related things. You are responsible for any consequences that may arise from using the virtual machine. The owner of this script is not responsible for any consequences that may arise from using the virtual machine or you have edited these scripts. To disagree and cancel the setup, press Ctrl + C."
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mThanks to devos50 and everyone who contributed to or developed the qemu-ios project! Learn more here: https://devos50.github.io/blog/2022/ipod-touch-qemu.\e[0m"
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mAutomatically go to next step after 60 seconds or continue immediately by pressing any key and you agree to the above."
if read -r -t 60 -n 1 _; then
    echo "Pressed the key and continued immediately."
else
    echo "60 seconds elapsed, auto continue."
fi
clear

setname='ipod2g'

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
echo -e '\e[1;37m[i] Installing Linux...\e[0m'
proot-distro install debian:11 --name debian11
clear
echo -e '\e[1;37m[i] Downloading QEMU...\e[0m'
if [ ! -e ""$PREFIX"/var/lib/proot-distro/containers/debian11/rootfs/usr/local/bin/qemu-system-arm-aipt2g" ]; then
    architecture=$(uname -m)
    if [[ "$architecture" =~ "aarch64" ]]; then
        url0='https://github.com/AnBui2004/qemu-ios/releases/download/n72ap_v1/qemu-system-arm-aipt2g_8.2.0_debian11_aarch64.tar.gz'
        url1='https://archive.org/download/qemu-system-arm-6.2.50-debian11-aarch64-ipod-touch-1g-emulator/qemu-system-arm-aipt2g_8.2.0_debian11_aarch64.tar.gz'
    elif [[ "$architecture" =~ "x86_64" ]]; then
        url0='https://github.com/AnBui2004/qemu-ios/releases/download/n72ap_v1/qemu-system-arm-aipt2g_8.2.0_debian11_amd64.tar.gz'
        url1='https://archive.org/download/qemu-system-arm-6.2.50-debian11-aarch64-ipod-touch-1g-emulator/qemu-system-arm-aipt2g_8.2.0_debian11_amd64.tar.gz'
    else
        rm -f setup1.sh
        clear
        echo -e "\e[1;37m[!] Unsupported architecture!"
        echo -e "\e[1;37m-\e[0m"
        echo -e "\e[1;37mAlpine only supports ARM 64-bit architecture. Your device's architecture is not supported."
        echo -e "\e[1;37m-\e[0m"
        echo -e "\e[1;37mSetup was canceled."
        exit
        cd
    fi
    cd $PREFIX/var/lib/proot-distro/containers/debian11/rootfs/root
    aria2c -x 4 -o qemu-system.tar.gz $url0
    if [ -e "qemu-system.tar.gz.aria2" ] || [ ! -e "qemu-system.tar.gz" ]; then
        rm -r ./qemu-system*
        aria2c -x 4 -o qemu-system.tar.gz $url1
    fi
    if [ -e "qemu-system.tar.gz.aria2" ] || [ ! -e "qemu-system.tar.gz" ]; then
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
    architecture=$(uname -m)
    if [[ "$architecture" =~ "aarch64" ]]; then
        url0='https://github.com/AnBui2004/qemu-ios/releases/download/n72ap_v1/qemu-tools_8.2.0_debian11_aarch64.tar.gz'
        url1='https://archive.org/download/qemu-system-arm-6.2.50-debian11-aarch64-ipod-touch-1g-emulator/qemu-tools_8.2.0_debian11_aarch64.tar.gz'
    elif [[ "$architecture" =~ "x86_64" ]]; then
        url0='https://github.com/AnBui2004/qemu-ios/releases/download/n72ap_v1/qemu-tools_8.2.0_debian11_amd64.tar.gz'
        url1='https://archive.org/download/qemu-system-arm-6.2.50-debian11-aarch64-ipod-touch-1g-emulator/qemu-tools_8.2.0_debian11_amd64.tar.gz'
    else
        rm -f setup1.sh
        clear
        echo -e "\e[1;37m[!] Unsupported architecture!"
        echo -e "\e[1;37m-\e[0m"
        echo -e "\e[1;37mAlpine only supports ARM 64-bit architecture. Your device's architecture is not supported."
        echo -e "\e[1;37m-\e[0m"
        echo -e "\e[1;37mSetup was canceled."
        exit
        cd
    fi
    cd $PREFIX/var/lib/proot-distro/containers/debian11/rootfs/root
    aria2c -x 4 -o qemu-tools.tar.gz $url0
    if [ -e "qemu-tools.tar.gz.aria2" ] || [ ! -e "qemu-tools.tar.gz" ]; then
        rm -r ./qemu-tools*
        aria2c -x 4 -o qemu-tools.tar.gz $url1
    fi
    if [ -e "qemu-tools.tar.gz.aria2" ] || [ ! -e "qemu-tools.tar.gz" ]; then
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
echo -e '\e[1;37m[i] Downloading files...\e[0m'
cd $PREFIX/var/lib/proot-distro/containers/debian11/rootfs/root
mkdir VM
cd VM
mkdir $setname
cd $setname
rm bootrom_240_4
rm nand_n72ap.zip
rm nor_n72ap.bin
rm -r nand
aria2c -x 4 https://github.com/devos50/qemu-ios/releases/download/n72ap_v1/bootrom_240_4
if [ -e "bootrom_240_4.aria2" ]; then
    echo -e '\e[1;37m[!] Error!\e[0m'
    echo -e '\e[1;37m--\e[0m'
    echo -e '\e[1;37mDownload failed. Please try again later.\e[0m'
    rm -r ./*
    cd
    exit
fi
aria2c -x 4 https://github.com/devos50/qemu-ios/releases/download/n72ap_v1/nand_n72ap.zip
if [ -e "nand_n72ap.zip.aria2" ] || [ ! -e "nand_n72ap.zip" ]; then
    echo -e '\e[1;37m[!] Error!\e[0m'
    echo -e '\e[1;37m--\e[0m'
    echo -e '\e[1;37mDownload failed. Please try again later.\e[0m'
    rm -r ./*
    cd
    exit
fi
aria2c -x 4 https://github.com/devos50/qemu-ios/releases/download/n72ap_v1/nor_n72ap.bin
if [ -e "nor_n72ap.bin.aria2" ] || [ ! -e "nor_n72ap.bin" ]; then
    echo -e '\e[1;37m[!] Error!\e[0m'
    echo -e '\e[1;37m--\e[0m'
    echo -e '\e[1;37mDownload failed. Please try again later.\e[0m'
    rm -r ./*
    cd
    exit
fi
clear
echo -e '\e[1;37m[i] Extracting...\e[0m'
unzip nand_n72ap.zip
rm nand_n72ap.zip
clear
echo -e '\e[1;37m[i] Just a sec...\e[0m'
cd $PREFIX/var/lib/proot-distro/containers/debian11/rootfs/root
curl -o "setup"$setname".sh" https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupqemu/v2/ipod/2g/setupqemuvm2.sh
chmod +rwx "setup"$setname".sh"
setqemucommand='qemu-system-arm-aipt2g -M iPod-Touch,bootrom=bootrom_240_4,nand=nand,nor=nor_n72ap.bin -serial mon:stdio -cpu max -m 2G -d unimp -accel tcg,thread=single,tb-size=2048 -monitor vc -vnc :2'
cd $PREFIX/var/lib/proot-distro/containers/debian11/rootfs/root/VM/$setname
echo $setqemucommand > "start"$setname"vm.sh"
chmod +rwx "start"$setname"vm.sh"
cd $PREFIX/var/lib/proot-distro/containers/debian11/rootfs
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
