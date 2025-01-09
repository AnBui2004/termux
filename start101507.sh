setname='101507'
diskfilename='101507.qcow2'
sed -i "/start"$setname"/d" /etc/profile
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to run Windows 10 build 1507 now? Enter the corresponding number and press enter to start. Enter nothing and press enter to exit and continue using Debian."
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37m1. Run now"
echo -e "\e[1;37m2. Edit"
echo -e "\e[1;37m3. Remove VM"
echo -e "\e[1;37mOther. Exit"
echo -e "\e[1;37m--------------------"
read -p $'' vmoption
if [ $vmoption == '1' ]; then
cd
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mStarting VM..."
echo -e "\e[1;37mVNC Server address: localhost:2"
echo -e "\e[1;37m--------------------"
./start"$setname"vm.sh
clear
./start"$setname".sh
fi
if [ $vmoption == '2' ]; then
cd
nano start"$setname"vm.sh
clear
./start"$setname".sh
fi
if [ $vmoption == '3' ]; then
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mThis VM will be deleted after 10 seconds. To cancel, press Ctrl + C."
echo -e "\e[1;37m--------------------"
sleep 10
sed -i "/start"$setname"/d" /etc/profile
cd
rm start"$setname"vm.sh
rm /storage/emulated/0/VM/"$diskfilename"
rm /data/data/com.termux/files/home/start"$setname".sh
rm start"$setname".sh
clear
echo -e "\e[1;37mDone!"
fi