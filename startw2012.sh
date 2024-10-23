sed -i '/startw2012/d' /etc/profile
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to run Windows Server 2012 R2 now? Enter the corresponding number and press enter to start. Enter nothing and press enter to exit and continue using Debian."
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37m1. Run now"
echo -e "\e[1;37m2. Edit"
echo -e "\e[1;37m3. Remove from Debian startup"
echo -e "\e[1;37m4. Remove VM"
echo -e "\e[1;37mOther. Exit"
echo -e "\e[1;37m--------------------"
read -p $'' vmoption
if [ $vmoption == '1' ]; then
cd
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mStarting VM..."
echo -e "\e[1;37m--------------------"
./startw2012vm.sh
clear
./startw2012.sh
fi
if [ $vmoption == '2' ]; then
cd
nano startw2012vm.sh
clear
./startw2012.sh
fi
if [ $vmoption == '3' ]; then
sed -i '/startw2012/d' /etc/profile
clear
echo -e "\e[1;37mDone!"
./startw2012.sh
fi
if [ $vmoption == '4' ]; then
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mThis VM will be deleted after 10 seconds. To cancel, press Ctrl + C."
echo -e "\e[1;37m--------------------"
sleep 10
sed -i '/startw2012/d' /etc/profile
cd
rm startw2012vm.sh
rm /storage/emulated/0/VM/ws2012r2.qcow2
rm /data/data/com.termux/files/home/startw2012.sh
rm startw2012.sh
clear
echo -e "\e[1;37mDone!"
fi