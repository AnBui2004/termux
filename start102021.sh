clear
echo -e "\e[1;37mDo you want to run Windows 10 IoT LTSC 2021 now?"
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37m1. Run now"
echo -e "\e[1;37m2. Edit"
echo -e "\e[1;37m3. Remove from Debian startup"
echo -e "\e[1;37m4. Remove VM"
echo -e "\e[1;37mOther. Exit"
read -p $'' vmoption
if [ $vmoption == '1' ]; then
cd
clear
./start102021vm.sh
fi
if [ $vmoption == '2' ]; then
cd
nano start102021vm.sh
clear
fi
if [ $vmoption == '3' ]; then
sed -i '/start102021/d' /etc/profile
clear
echo -e "\e[1;37mDone!"
fi
if [ $vmoption == '4' ]; then
sed -i '/start102021/d' /etc/profile
cd
rm start102021vm.sh
rm /storage/emulated/0/VM/W10IoTLTSC2021.qcow2
rm /data/data/com.termux/files/home/start102021.sh
rm start102021.sh
echo -e "\e[1;37mDone!"
fi