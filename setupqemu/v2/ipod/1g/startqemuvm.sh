setname='ipod1g'
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
pulseaudio --start --disable-shm=1 --exit-idle-time=-1
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to run Apple iPod Touch 1G emulator now? Enter the corresponding number and press enter to start. Enter nothing and press enter to exit and continue using Debian 11."
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37m1. Run now"
echo -e "\e[1;37m2. Edit"
echo -e "\e[1;37m3. Remove VM"
echo -e "\e[1;37m4. See instructions"
echo -e "\e[1;37mOther. Exit"
echo -e "\e[1;37m--------------------"
read -n 1 vmoption

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
        nano start"$setname"vm.sh
        clear
        ./start"$setname".sh
        ;;
    '3')
        clear
        echo -e "\e[1;37m[!] Removing VM..."
        echo -e "\e[1;37m-"
        echo -e "\e[1;37mThis VM will be deleted after 10 seconds. To cancel, press Ctrl + C."
        echo -e "\e[1;37m-"
        sleep 10
        sed -i "/start"$setname"/d" /etc/profile
        cd
        rm start"$setname"vm.sh
        rm -r /storage/emulated/0/VM/"$setname"
        rm /data/data/com.termux/files/home/start"$setname".sh
        rm start"$setname".sh
        clear
        echo -e "\e[1;37mDone!"
        echo -e "\e[1;37m--"
        echo -e "\e[1;37mIf you want to uninstall Debian 11, run the following command:"
        echo -e "\e[1;37m-> exit <-"
        echo -e "\e[1;37mAnd run this command:"
        echo -e "\e[1;37m-> proot-distro remove debian11 <-"
        ;;
    '4')
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
        echo -e "\e[1;37m[3] Press home button:"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37mCopy -> hhhhhhhhhhhhhhhhhhhhh <- to the clipboard, and each time you want to press the Home button, paste it from the keyboard clipboard into VNC Viewer. If pasting it once doesn't work, paste it repeatedly. If you're using VNC Viewer on a PC, just keep pressing the 'h' key repeatedly."
        echo -e "\e[1;37m"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37m"
        echo -e "\e[1;37m[4] Qemu Monitor:"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37mPress Ctrl + Alt + 2 in VNC Viewer to switch to it."
        echo -e "\e[1;37m"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37m"
        echo -e "\e[1;37m[5] Remove:"
        echo -e "\e[1;37m-"
        echo -e "\e[1;37mIt will only remove files related to this virtual machine and will not remove any packages related to Termux and Debian."
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