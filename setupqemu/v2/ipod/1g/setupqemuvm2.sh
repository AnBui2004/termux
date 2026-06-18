setname='ipod1g'

clear
echo -e '\e[1;37m[i] Installing packages...\e[0m'
sed -i "/setup"$setname"/d" /etc/profile
if [ -e "/usr/local/bin/qemu-system-arm-aipt1g" ]; then
    echo "qemu-system-arm-aipt1g is already installed."
    rm qemu-system.tar.gz
    rm qemu-tools.tar.gz
else
    apt update
    apt upgrade -y
    apt install aria2 libx11-6 libxxf86vm1 libgl1 libpixman-1-0 libepoxy0 libsnappy1v5 liblzo2-2 libpng16-16 libjpeg62 libgnutls30 libsdl2-2.0-0 libvdeplug2 libvte-2.91-0 libsdl2-image-2.0-0 libjack0 libsndio7.0 libcurl4 libssh-4 libspice-server1 libslirp0 libvirglrenderer1 libusbredirparser1 pulseaudio libcapstone4 libbpf0 libusb-1.0-0 liburing1 libfuse3-3 libaio1 libnfs13 -y
    tar -xzvf qemu-system.tar.gz -C /
    tar -xzvf qemu-tools.tar.gz -C /
    rm qemu-system.tar.gz
    rm qemu-tools.tar.gz
fi
clear
echo -e '\e[1;37m[i] Just a sec...\e[0m'
cd
aria2c -o "start"$setname".sh" https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupqemu//v2/ipod/1g/startqemuvm.sh
chmod +rwx "start"$setname".sh"
clear
echo -e '\e[1;37m[i] Done!\e[0m'
echo -e '\e[1;37m-\e[0m'
echo -e "\e[1;37mUse this command to run: \"./start"$setname".sh\"\e[0m"
echo -e '\e[1;37m-\e[0m'
echo -e '\e[1;37mThe necessary files are in the VM folder on your phone. Please do not delete the files there if you still use them.\e[0m'
echo -e '\e[1;37m-\e[0m'
rm "setup"$setname".sh"
rm "/data/data/com.termux/files/home/setup1.sh"
exit