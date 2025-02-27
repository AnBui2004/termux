sed -i "/start"$setname"/d" /etc/profile
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mAccess to internal storage denied. Please grant Termux access to internal storage."
echo -e "\e[1;37m--------------------"
exit
fi
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to run "$osname" now? Enter the corresponding number and press enter to start. Enter nothing and press enter to exit and continue using Debian."
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37m1. Run now"
echo -e "\e[1;37m2. Run now with Shared Folder"
echo -e "\e[1;37m3. Edit"
echo -e "\e[1;37m4. Show download links for files"
echo -e "\e[1;37m5. Remove VM"
echo -e "\e[1;37mOther. Exit"
echo -e "\e[1;37m--------------------"
read -n 1 vmoption
if [ ! -d "/storage/emulated/0/VM/Shared" ]; then
    mkdir /storage/emulated/0/VM/Shared
    chmod +rwx /storage/emulated/0/VM/Shared
fi
if [ $vmoption == '1' ]; then
cd
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mVM is running..."
echo -e "\e[1;37mVNC Server address: localhost:2"
echo -e "\e[1;37m--------------------"
./start"$setname"vm.sh
clear
./start"$setname".sh
fi
if [ $vmoption == '2' ]; then
cd
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mVM is running..."
echo -e "\e[1;37mVNC Server address: localhost:2"
echo -e "\e[1;37mAnd Shared Folder is in VM folder on your phone."
echo -e "\e[1;37m--------------------"
./start"$setname"vms.sh
clear
./start"$setname".sh
fi
if [ $vmoption == '3' ]; then
cd
nano start"$setname"vm.sh
rm start"$setname"vms.sh
cp start"$setname"vm.sh start"$setname"vms.sh
chmod +rwx "start"$setname"vms.sh"
echo -n " -drive file=fat:rw:/storage/emulated/0/VM/Shared" >> "start"$setname"vms.sh"
convertosingleline=$(paste -s -d:" " start101903vms.sh)
echo ${convertosingleline//: -drive/ -drive} > start101903vms.sh
clear
./start"$setname".sh
fi
if [ $vmoption == '4' ]; then
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mLINKS:"
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37m"$setfileurl""
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mPress any key to exit."
echo -e "\e[1;37m--------------------"
read -n 1
clear
./start"$setname".sh
fi
if [ $vmoption == '5' ]; then
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mThis VM will be deleted after 10 seconds. To cancel, press Ctrl + C."
echo -e "\e[1;37m--------------------"
sleep 10
sed -i "/start"$setname"/d" /etc/profile
cd
rm start"$setname"vm.sh
rm -r /storage/emulated/0/VM/"$setname"
rm /data/data/com.termux/files/home/start"$setname".sh
rm start"$setname".sh
clear
echo -e "\e[1;37mDone!"
fi