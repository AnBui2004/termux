sed -i "/start"$setname"/d" /etc/profile
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mAccess to internal storage denied. Please grant Termux access to internal storage."
echo -e "\e[1;37m--------------------"
exit
fi
export PULSE_SERVER=127.0.0.1
if grep -q "Alpine" /etc/os-release 2>/dev/null; then
    thisdistro="Alpine"
else
    thisdistro="Debian"
fi
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to run "${osname}" now? Enter the corresponding number and press enter to start. Enter nothing and press enter to exit and continue using $thisdistro."
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37m1. Run now"
echo -e "\e[1;37m2. Run now with Shared Folder"
echo -e "\e[1;37m3. Edit"
echo -e "\e[1;37m4. Show download links for files"
echo -e "\e[1;37m5. Remove VM"
echo -e "\e[1;37m6. See instructions"
echo -e "\e[1;37mOther. Exit"
echo -e "\e[1;37m--------------------"
read -n 1 vmoption
if [ ! -d "/storage/emulated/0/VM/Shared" ]; then
    mkdir /storage/emulated/0/VM/Shared
    chmod +rwx /storage/emulated/0/VM/Shared
fi

case "$vmoption" in
    '1')
        cd
        clear
        echo -e "\e[1;37m[i] VM is running..."
        echo -e "\e[1;37m-"
        echo -e "\e[1;37mVNC Server address:"
        echo -e "\e[1;37mlocalhost:2"
        echo -e "\e[1;37mOr"
        echo -e "\e[1;37mlocalhost:5902"
        echo -e "\e[1;37m-"
        sleep 3
        ./start"$setname"vm.sh
        clear
        ./start"$setname".sh
        ;;
    '2')
        cd
        clear
        echo -e "\e[1;37m[i] VM is running..."
        echo -e "\e[1;37m-"
        echo -e "\e[1;37mVNC Server address:"
        echo -e "\e[1;37mlocalhost:2"
        echo -e "\e[1;37mOr"
        echo -e "\e[1;37mlocalhost:5902"
        echo -e ""
        echo -e "\e[1;37mThe shared folder is the Shared folder located in the VM folder on your device (/storage/emulated/0/VM/Shared)."
        echo -e "\e[1;37m-"
        sleep 3
        ./start"$setname"vms.sh
        clear
        ./start"$setname".sh
        ;;
    '3')
        cd
        nano start"$setname"vm.sh
        rm start"$setname"vms.sh
        cp start"$setname"vm.sh start"$setname"vms.sh
        chmod +rwx "start"$setname"vms.sh"
        echo -n " -drive file=fat:rw:/storage/emulated/0/VM/Shared" >> "start"$setname"vms.sh"
        convertosingleline=$(paste -s -d:" " "start${setname}vms.sh")
        echo "${convertosingleline//: -drive/ -drive}" > "start${setname}vms.sh"
        clear
        ./start"$setname".sh
        ;;
    '4')
        clear
        echo -e "\e[1;37m[i] Download links for files:"
        echo -e "\e[1;37m--"
        echo -e "\e[1;37m"
        echo -e "\e[1;37m"$setfileurl""
        echo -e "\e[1;37m"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37m"
        echo -e "\e[1;37m"$setfileurl2""
        echo -e "\e[1;37m"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37m"
        echo -e "\e[1;37m"$setfileurl3""
        echo -e "\e[1;37m"
        echo -e "\e[1;37m--"
        echo -e "\e[1;37mPress any key to exit."
        read -n 1
        clear
        ./start"$setname".sh
        ;;
    '5')
        clear
        echo -e "\e[1;37m[!] Removing VM..."
        echo -e "\e[1;37m-"
        echo -e "\e[1;37mThis VM will be deleted after 10 seconds. To cancel, press Ctrl + C."
        echo -e "\e[1;37m-"
        sleep 10
        sed -i "/start"$setname"/d" /etc/profile
        cd
        rm start"$setname"vm.sh
        rm start"$setname"vms.sh
        rm -r /storage/emulated/0/VM/"$setname"
        rm /data/data/com.termux/files/home/start"$setname".sh
        rm start"$setname".sh
        clear
        echo -e "\e[1;37mDone!"
        ;;
    '6')
        clear
        echo -e "\e[1;37mSee instructions:"
        echo -e "\e[1;37m--"
        echo -e "\e[1;37m"
        echo -e "\e[1;37m[1] Control:"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37mYou need to connect via VNC Server to port 5902 or 2."
        echo -e "\e[1;37m"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37m"
        echo -e "\e[1;37m[2] Data directory:"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37mThe data directory is the VM on your device (/storage/emulated/0/VM)."
        echo -e "\e[1;37m"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37m"
        echo -e "\e[1;37m[3] Shared folder:"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37mThe shared folder is the Shared folder located in the VM folder on your device (/storage/emulated/0/VM/Shared)."
        echo -e "\e[1;37m"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37m"
        echo -e "\e[1;37m[4] Qemu Monitor:"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37mUse the command directly here after running it or you can use it in VNC Viewer."
        echo -e "\e[1;37m"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37m"
        echo -e "\e[1;37m[5] Download:"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37mFiles will be downloaded with up to 4 threads for higher speeds. The setup will not re-download files unless you delete them."
        echo -e "\e[1;37m"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37m"
        echo -e "\e[1;37m[6] Remove:"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37mIt will only remove files related to this virtual machine and will not remove any packages related to Termux and Debian."
        echo -e "\e[1;37m"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37m"
        echo -e "\e[1;37m[7] Password:"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37mThe password is usually one of the following if applicable:"
        echo -e "\e[1;37mqwerty13579"
        echo -e "\e[1;37mqwerty13579."
        echo -e "\e[1;37mqwerty13579!"
        echo -e "\e[1;37mqwerty2468"
        echo -e "\e[1;37mqwerty2468."
        echo -e "\e[1;37mqwerty2468!"
        echo -e "\e[1;37m12345678"
        echo -e "\e[1;37m"
        echo -e "\e[1;37m--"
        echo -e "\e[1;37mPress any key to exit."
        read -n 1
        clear
        ./start"$setname".sh
        ;;
    *)
        clear
        echo -e "\e[1;37mExiting..."
        ;;
esac
clear