clear
echo -e "\e[1;37mThis is the original project: https://github.com/YourTeachermd/External-Data-mobox"
echo -e "\e[1;37mAnd customized by https://github.com/AnBui2004"
echo -e "\e[0;33m--------------------"

read -p $'\e[1;37mEnter the path of your Micro SD card or USB: \e[0m' external
if [ ! -d "$external" ]; then
    echo -e "\e[0;33m--------------------"
    echo -e "\e[91mAborted because you did not enter the correct Micro SD card or USB path."
    echo -e "\e[0;33m--------------------"
    exit 1
fi

echo -e "\e[0;33m--------------------"
read -p $'\e[1;37mEnter the Wine version you selected for Mobox: \e[0m' wine
echo -e "\e[0;33m--------------------"
if [ -z "$wine" ]; then
    echo -e "\e[91mAborted because you did not enter the correct Wine version."
    echo -e "\e[0;33m--------------------"
    exit 1
fi

if [ ! -d "/data/data/com.termux/files/usr/glibc/$wine" ]; then
    echo -e "\e[91mLooks like you haven't started Wine yet, run it and try again. Or you did not enter the correct version of Wine. Please check back."
    echo -e "\e[0;33m--------------------"
    exit 1
fi

read -p $'\e[1;37mEnter the folder name you want, it will appear on drive C and linked to your Micro SD card or USB: \e[0m' name
echo -e "\e[0;33m--------------------"
if [ -z "$name" ]; then
    name="sdcard"
    echo -e "\e[1,37mSince you didn't name this new folder, it will be named "sdcard". Continue after 3 seconds..."
    echo -e "\e[0;33m--------------------"
    sleep 3
fi

ln -s "$external" "$PREFIX/glibc/$wine/.wine/drive_c/$name"

if [ -d "/data/data/com.termux/files/usr/glibc/$wine/.wine/drive_c/$name" ]; then
    clear
    echo -e "\e[0;33m--------------------"
    echo -e "\e[1;37mDone!"
else
    clear
    echo -e "\e[0;33m--------------------"
    echo -e "\e[91mError! An error occurred. Please try again later."
fi
echo -e "\e[0;33m--------------------"