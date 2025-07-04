clear
architecture=$(uname -m)
if [[ "$architecture" != *64* ]]; then
    echo -e "\e[1;37m[!] Cannot continue!"
    echo -e "\e[1;37m-\e[0m"
    echo -e "\e[1;37mThe device or operating system you are using does not support 64-bit."
    exit
fi
echo -e "\e[1;37m[!] Warning!"
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mPlease do not run any other commands when this setup begins. If you're running other commands, they haven't finished executing yet or don't want some packages to be forced to be updated when setting up."
echo ""
echo -e "\e[1;37mThe Proton version that will be installed is from doo99 on sharemods.com."
echo ""
echo -e "\e[1;37mThe author of this script will not be responsible for any unintended problems that occur or if this script has been modified."
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mPress any key to continue or Ctrl + C to cancel."
read -n 1
clear
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
    clear
    echo -e "\e[1;37m[!] Please grant access to storage!"
    yes y | termux-setup-storage
    sleep 3
    echo -e "\e[1;37m[i] Automatically go to next step after 3 seconds."
    sleep 3
fi
clear
echo -e "\e[1;37m[i] Graphics driver."
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mIf your device is equipped with Snapdragon CPU with Adreno GPU, you should find the appropriate driver on GitHub, copy the download link of the file containing the driver in zip format, paste it here, press enter and it will be installed (old drivers will be deleted). You can skip by pressing enter now but black screen error may occur."
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mIf your phone is not equipped with Snapdragon CPU and Adreno GPU, press enter to skip and continue but black screen error may occur.\e[0m"
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mIf you want to install or change a driver after Proton is installed, run this script again and it will only install the driver and not reinstall Proton.\e[0m"
echo -e "\e[1;37m-\e[0m"
read linkdriver
clear
echo -e '\e[1;37m[i] Installing packages...\e[0m'
apt update
yes y | apt upgrade -y
apt install x11-repo -y
apt install aria2 unzip -y
clear
cd
if [[ -n "$linkdriver" ]]; then
    echo -e '\e[1;37m[i] Installing driver...\e[0m'
    cd ../usr
    if [ ! -d "drivers" ]; then
        mkdir drivers
        chmod +rwx drivers
    else
        rm -rf drivers/*
    fi
    cd
    mkdir tempdriver
    cd tempdriver
    aria2c -x 4 -o driver.zip "$linkdriver"
    unzip driver.zip
    cd
    mv "$(find ./tempdriver -name '*.so' -print -quit)" ../usr/drivers/vulkan.adreno.so
    rm -rf tempdriver
    clear
fi
if [ -f "../usr/bin/arm64ec-wine" ]; then
    echo -e "\e[1;37m[i] No installation required!"
    echo -e "\e[1;37m-\e[0m"
    echo -e "\e[1;37mProton is already installed and no further installation is required. Use the command below to run it."
    echo -e "\e[1;37m-\e[0m"
    echo -e "\e[1;37marm64ec-wine"
    exit
fi
echo -e '\e[1;37m[i] Installing Proton...\e[0m'
aria2c -x 4 -o proton.tar.xz https://archive.org/download/proton-9.0-arm64ec-installer-fix-for-termux-nbab/proton-9.0-arm64ec-installer-fix.tar.xz
if [ ! -e "proton.tar.xz" ]; then
    echo -e "\e[1;37m[!] Cannot continue!"
    echo -e "\e[1;37m-\e[0m"
    echo -e "\e[1;37mUnable to download Proton."
    exit
fi
tar -xf proton.tar.xz
rm proton.tar.xz
cd ./proton-9.0-arm64ec-installer-fix/proton-arm64ec
chmod +rwx installer.sh
sed -i "/termux-setup-storage/d" installer.sh
sed -i "/am start/d" installer.sh
./installer.sh
cd
rm -rf proton-9.0-arm64ec-installer-fix