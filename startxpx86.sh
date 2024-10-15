sed -i '/startxpx86/d' /etc/profile
clear
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to run Windows 10 IoT LTSC 2021 now? Enter the corresponding number and press enter to start. Enter nothing and press enter to exit and continue using Debian."
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
./startxpx86vm.sh
clear
./startxpx86.sh
fi
if [ $vmoption == '2' ]; then
cd
nano startxpx86vm.sh
clear
./startxpx86.sh
fi
if [ $vmoption == '3' ]; then
sed -i '/startxpx86/d' /etc/profile
clear
echo -e "\e[1;37mDone!"
./startxpx86.sh
fi
if [ $vmoption == '4' ]; then
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mThis VM will be deleted after 10 seconds. To cancel, press Ctrl + C."
echo -e "\e[1;37m--------------------"
sleep 10
sed -i '/startxpx86/d' /etc/profile
cd
rm startxpx86vm.sh
rm /storage/emulated/0/VM/XPSP3VL.qcow2
rm /data/data/com.termux/files/home/startxpx86.sh
rm startxpx86.sh
clear
echo -e "\e[1;37mDone!"
fi