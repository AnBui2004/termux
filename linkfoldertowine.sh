echo -e "\e[1;37mThis is the original project: https://github.com/YourTeachermd/External-Data-mobox"
echo -e "\e[1;37mAnd customized by https://github.com/AnBui2004"
echo -e "\e[0;33m--------------------"
read -p $'\e[1;37mEnter the path of your Micro SD card or USB: \e[0m' external
echo -e "\e[0;33m--------------------"
read -p $'\e[1;37mEnter the Wine version you selected for Mobox: \e[0m' wine
echo -e "\e[0;33m--------------------"
read -p $'\e[1;37mEnter the folder name you want, it will appear on drive C and linked to your Micro SD card or USB: \e[0m' name
echo -e "\e[0;33m--------------------"

if [ ! -d "$external" ]; then
    echo -e "\e[91mAborted because you did not enter the Micro SD card or USB path."
    exit 1
fi

if [ -z "$wine" ]; then
    echo -e "\e[91mAborted because you did not enter the correct Wine version."
    exit 1
fi

if [ -z "$name" ]; then
    echo -e "\e[91mAborted because you did not enter a new folder name to link your Micro SD card or USB to Wine."
    exit 1
fi

if [ ! -f "/data/data/com.termux/files/usr/glibc/$wine" ]; then
    read -p $'\e[1;37mDetected that you have not initially set up Wine or you have entered the Wine version incorrectly. Do you want to continue? Enter "1" to continue or else to cancel: \e[0m' choosed
    echo -e "\e[0;33m--------------------"
    if [$choosed == 1]; then
        mkdir "/data/data/com.termux/files/usr/glibc/$wine/.wine/drive_c"
        if [ ! -f "/data/data/com.termux/files/usr/glibc/$wine/.wine/drive_c" ]; then
        echo -e "\e[0;32mKeep going..."
        echo -e "\e[0;33m--------------------"
        else
        echo -e "\e[0;31mCannot continue because the folder cannot be created."
        exit 1
        fi
    else
    
    fi
fi

ln -s "$external" "$PREFIX/glibc/$wine/.wine/drive_c/$name"

if [ ! -f "/data/data/com.termux/files/usr/glibc/$wine/.wine/drive_c/$name" ]; then
    read -p $'\e[1;37mDone! Do you want to run Mobox now? \e[0m' mobox
    if [$mobox == 1]; then
        cd
        mobox
    fi
else
    echo -e "\e[0;31mError! An error occurred. Please try again later."
fi
echo -e "\e[0;33m--------------------"