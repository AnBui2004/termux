clear
echo -e '\e[1;37m[i] Installing packages...\e[0m'
sed -i "/setup"$setname"/d" /etc/profile
apt update
if dpkg -s qemu-system-x86 | grep -q "Status: install ok installed"; then
    echo "qemu-system-x86_64 installed and do not update to keep the old version."
else
    apt upgrade -y
fi
apt install pulseaudio tightvncserver libbpf1 libglib2.0-0 libibverbs1 libjpeg62-turbo libnuma1 libpixman-1-0 libpmem1 libpng16-16 librdmacm1 libsasl2-2 libslirp0 liburing2 libvdeplug2 libbrlapi0.8 libcacard0 libepoxy0 libgbm1 libncursesw6 libsndio7.0 libspice-server1 libusb-1.0-0 libusbredirparser1 libfdt1 seabios ipxe-qemu -y
cd temp7
ARCH=$(dpkg --print-architecture)
dpkg -i lib*_${ARCH}.deb
dpkg -i *common*_${ARCH}.deb
dpkg -i *_all.deb
dpkg -i qemu*_${ARCH}.deb
cd ../
rm -rf temp7
export PULSE_SERVER=127.0.0.1
clear
echo -e '\e[1;37m[i] Just a sec...\e[0m'
if [ -e "/storage/emulated/0/VM/"$setname"/"$diskfilename"" ]; then
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