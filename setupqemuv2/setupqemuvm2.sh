clear
echo -e '\e[1;37m[i] Installing packages...\e[0m'
sed -i "/setup"$setname"/d" /etc/profile
if [ -e "/usr/local/bin/qemu-system-x86_64" ]; then
    echo "qemu-system-x86_64 is already installed."
else
    apk update
    apk add aria2 nano virglrenderer sdl2 sdl2_image libslirp curl libnfs libssh vde2-libs pixman libusb usbredir pulseaudio jack libaio liburing fuse3-libs snappy lzo zlib capstone libcbor keyutils-libs ndctl rdma-core linux-pam spice libseccomp libbpf vte3 sndio
    
    architecture=$(uname -m)
    if [[ "$architecture" =~ "aarch64" ]]; then
        qemuurl="https://github.com/AnBui2004/Vectras-VM-Emu-Android/releases/download/4.4.7/base-qemu-7.2.22-3dfx-july-2026-vectras-vm-arm64-v8a.tar.gz"
    elif [[ "$architecture" =~ "x86_64" ]]; then
        qemuurl="https://github.com/AnBui2004/Vectras-VM-Emu-Android/releases/download/4.4.7/base-qemu-7.2.22-3dfx-july-2026-vectras-vm-x86_64.tar.gz"
    elif [[ "$architecture" =~ "arm" ]]; then
        qemuurl="https://github.com/AnBui2004/Vectras-VM-Emu-Android/releases/download/4.4.7/base-qemu-7.2.22-july-2026-vectras-vm-armeabi-v7a.tar.gz"
    elif [[ "$architecture" =~ "x86" ]]; then
        qemuurl="https://github.com/AnBui2004/Vectras-VM-Emu-Android/releases/download/4.4.7/base-qemu-7.2.22-july-2026-vectras-vm-x86.tar.gz"
    elif [[ "$architecture" =~ "i386" || "$architecture" =~ "i686" ]]; then
        qemuurl="https://github.com/AnBui2004/Vectras-VM-Emu-Android/releases/download/4.4.7/base-qemu-7.2.22-july-2026-vectras-vm-x86.tar.gz"
    fi

    clear
    echo -e '\e[1;37m[i] Downloading QEMU...\e[0m'
    aria2c -x 4 --async-dns=false --disable-ipv6 --check-certificate=false -o setup.tar.gz "$qemuurl"
    
    clear
    echo -e '\e[1;37m[i] Installing QEMU...\e[0m'
    tar -xzvf setup.tar.gz -C /
    rm setup.tar.gz
    chmod 755 /usr/local/bin/qemu*
fi
export PULSE_SERVER=127.0.0.1
clear
echo -e '\e[1;37m[i] Just a sec...\e[0m'
if [ -f "/storage/emulated/0/VM/"$setname"/"$diskfilename"" ]; then
    cd
    curl -o "start"$setname"" https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupqemuv2/startqemuvm.sh

    sed -i -e "1iosname='$osname'" "start"$setname""
    sed -i -e "1isetname='$setname'" "start"$setname""
    sed -i -e "1isetfileurl='$setfileurl'" "start"$setname""
    sed -i -e "1isetfileurl2='$setfileurl2'" "start"$setname""
    sed -i -e "1isetfileurl3='$setfileurl3'" "start"$setname""

    sed -i '/^osname=/ s/_/ /g' "start"$setname""

    mv "start"$setname"" /usr/local/bin
    chmod 755 /usr/local/bin/start"$setname"

    clear
    echo -e '\e[1;37m[i] Done!\e[0m'
    echo -e '\e[1;37m-\e[0m'
    echo -e "\e[1;37mUse this command to run: \"start"$setname"\"\e[0m"
    echo -e '\e[1;37m-\e[0m'
    echo -e '\e[1;37mThe necessary files are in the VM folder on your phone. Please do not delete the files there if you still use them.\e[0m'
    echo -e '\e[1;37m-\e[0m'
    if [ -n "$notes" ]; then
        printf "\n"
        curl $notes
        printf "\n"
    fi
else
    sed -i "/start"$setname"/d" /etc/profile
    cd
    rm /vm/start"$setname"vm.sh
    rm /vm/start"$setname"vms.sh
    rm -r /storage/emulated/0/VM/"$setname"
    rm /usr/local/bin/start"$setname"
    rm /data/data/com.termux/files/usr/bin/start"$setname"
    clear
    echo -e "\e[0;33m[!] Unsuccessful!"
    echo -e "\e[1;37m-\e[0m"
    echo -e "\e[91mError! An error occurred. Please try again later."
fi
rm "setup"$setname"" >/dev/null 2>&1
rm "/data/data/com.termux/files/home/setup1.sh" >/dev/null 2>&1
rm "/data/data/com.termux/files/home/setup2.sh" >/dev/null 2>&1
exit