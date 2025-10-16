clear
echo -e '\e[1;37m[i] Installing packages...\e[0m'
sed -i "/setup"$setname"/d" /etc/profile
if [ -e "/usr/local/bin/qemu-system-x86_64" ]; then
    echo "qemu-system-x86_64 is already installed."
else
    apk update
    apk upgrade
    apk add aria2 tar dwm xfce4-terminal libslirp libslirp-dev pulseaudio-dev glib-dev pixman-dev zlib-dev spice-dev libusbredirparser usbredir-dev libiscsi-dev sdl2 sdl2-dev sdl2_image-dev libepoxy-dev virglrenderer-dev rdma-core libusb libaio ncurses-libs curl libnfs gtk+3.0 gtk+3.0-dev fuse libpulse libseccomp jack pipewire liburing mesa-dri-gallium mesa-vulkan-swrast vulkan-loader mesa-utils mesa-egl mesa-gbm mesa-vulkan-ati mesa-vulkan-broadcom mesa-vulkan-freedreno mesa-vulkan-panfrost
    architecture=$(uname -m)
    if [[ "$architecture" =~ "x86" ]]; then
        qemulink='https://github.com/xoureldeen/Vectras-VM-Android/releases/download/3.2.0/vectras-vm-x86_64.tar.gz'
    else
        qemulink='https://github.com/xoureldeen/Vectras-VM-Android/releases/download/3.2.0/vectras-vm-arm64-v8a.tar.gz'
    fi
    aria2c -x 4 --async-dns=false --disable-ipv6 --check-certificate=false -o setup.tar.gz $qemulink
    tar -xzvf setup.tar.gz -C /
    rm setup.tar.gz
fi
export PULSE_SERVER=127.0.0.1
clear
echo -e '\e[1;37m[i] Just a sec...\e[0m'
if [ -f "/storage/emulated/0/VM/"$setname"/"$diskfilename"" ]; then
    cd
    curl -o "start"$setname".sh" https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupqemu/startqemuvm.sh
    chmod +rwx "start"$setname".sh"

    # Use a loop to insert variables into the script
    declare -A variables=(
        [setfileurl3]="$setfileurl3"
        [setfileurl2]="$setfileurl2"
        [setfileurl]="$setfileurl"
        [setname]="$setname"
        [osname]="$osname"
    )

    for key in "${!variables[@]}"; do
        sed -i -e "1i$key='${variables[$key]}'" "start"$setname".sh"
    done

    sed -i '/^osname=/ s/_/ /g' "start"$setname".sh"

    clear
    echo -e '\e[1;37m[i] Done!\e[0m'
    echo -e '\e[1;37m-\e[0m'
    echo -e "\e[1;37mUse this command to run: \"./start"$setname".sh\"\e[0m"
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
    rm start"$setname"vm.sh
    rm -r /storage/emulated/0/VM/"$setname"
    rm start"$setname".sh
    rm /data/data/com.termux/files/home/start"$setname".sh
    clear
    echo -e "\e[0;33m[!] Unsuccessful!"
    echo -e "\e[1;37m-\e[0m"
    echo -e "\e[91mError! An error occurred. Please try again later."
fi
rm "setup"$setname".sh"
rm "/data/data/com.termux/files/home/setup1.sh"
rm "/data/data/com.termux/files/home/setup2.sh"
exit