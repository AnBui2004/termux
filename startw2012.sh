sed -i '/startxp2k5/d' /etc/profile
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to run Windows XP Media Center Edition 2005 now? Enter the corresponding number and press enter to start. Enter nothing and press enter to exit and continue using Debian."
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
./startxp2k5vm.sh
clear
./startxp2k5.sh
fi
if [ $vmoption == '2' ]; then
cd
nano startxp2k5vm.sh
clear
./startxp2k5.sh
fi
if [ $vmoption == '3' ]; then
sed -i '/startxp2k5/d' /etc/profile
clear
echo -e "\e[1;37mDone!"
./startxp2k5.sh
fi
if [ $vmoption == '4' ]; then
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mThis VM will be deleted after 10 seconds. To cancel, press Ctrl + C."
echo -e "\e[1;37m--------------------"
sleep 10
sed -i '/startxp2k5/d' /etc/profile
cd
rm startxp2k5vm.sh
rm /storage/emulated/0/VM/XPSP3VL.qcow2
rm /data/data/com.termux/files/home/startxp2k5.sh
rm startxp2k5.sh
clear
echo -e "\e[1;37mDone!"
fi