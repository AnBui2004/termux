clear
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
    echo -e "\e[1;37m[!] Please grant access to storage!"
    yes y | termux-setup-storage
    echo -e "\e[1;37m[i] Automatically go to next step after 5 seconds."
    sleep 5
fi
clear
echo -e "\e[1;37m[!] Warning!"
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mPlease do not run any other commands when this setup begins. If you're running other commands, they haven't finished executing yet or don't want some packages to be forced to be updated when setting up, press Ctrl + C now to cancel the setup immediately."
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mAutomatically go to next step after 10 seconds and you agreed."
sleep 10
clear
echo -e "\e[1;37m[!] Do not miss out!"
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mBy obtaining and running the virtual machine in any way, you agree to any Agreements and Policies provided by the vendor or owner of this operating system and other related things. You are responsible for any consequences that may arise from using the virtual machine. The owner of this script is not responsible for any consequences that may arise from using the virtual machine or you have edited these scripts. To disagree and cancel the setup, press Ctrl + C."
echo -e "\e[1;37m-\e[0m"
echo -e "\e[1;37mAutomatically go to next step after 20 seconds and you agreed."
sleep 20
clear
source ./setup1.sh
if [[ -z "$distro" ]]; then
    prootdistroname="debian"
else
    prootdistroname="$distro"
fi
echo -e '\e[1;37m[i] Installing packages...\e[0m'
apt update
yes y | apt upgrade -y
apt install x11-repo -y
apt install proot-distro p7zip wget pulseaudio aria2 -y
clear
echo -e '\e[1;37m[i] Setting up Pulseaudio...\e[0m'
export PULSE_SERVER=127.0.0.1
clear
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
    clear
    echo -e "\e[1;37m[!] Canceled!"
    echo -e "\e[1;37m-\e[0m"
    echo -e "\e[1;37mSetup was canceled because you did not grant Termux access to storage."
    echo -e "\e[1;37m-\e[0m"
    rm "setup1.sh"
    rm "setup2.sh"
    exit
fi
mkdir /storage/emulated/0/VM
mkdir /storage/emulated/0/VM/$setname
chmod +rwx /storage/emulated/0/VM
chmod +rwx /storage/emulated/0/VM/$setname
if [ ! -d "/storage/emulated/0/VM/Shared" ]; then
    mkdir /storage/emulated/0/VM/Shared
    chmod +rwx /storage/emulated/0/VM/Shared
fi
clear

# Refactor repetitive download logic into a reusable function for better maintainability.
function download_file {
    local url=$1
    local output=$2

    if [[ "$url" =~ "pixeldrain" ]]; then
        echo -e "\e[1;37m[!] You are limited to a maximum daily download size of 6GB from this server. If the download fails, please try again tomorrow."
        wget -O "$output" "$url"
    else
        if [[ "$url" =~ "anbui.ovh" ]]; then
            echo -e "\e[1;37m[!] Speeds up to 22 MB/s and may be unstable."
        fi
        aria2c -x 4 -o "$output" "$url"
    fi
}

if [ ! -e "/storage/emulated/0/VM/"$setname"/"$diskfilename"" ]; then
    setfileurl1=$setfileurl
    echo -e '\e[1;37m[i] Downloading disk image...\e[0m'
    echo -e "\e[1;37m-\e[0m"
    if [[ "$setfileurl" == *"pixeldrain"* || "$setfileurl" == *"google"* ]]; then
        echo -e "\e[1;37m[i] Downloading from high speed server."
    else
        if [[ "$setfileurl" == *"anbui.ovh"* ]]; then
            echo -e "\e[1;37m[i] You are downloading from my test server."
        else
            echo -e "\e[1;37m[!] Downloading from slow speed server."
        fi
    fi
    echo -e "\e[1;37m-\e[0m"
    cd /storage/emulated/0/VM/$setname

    download_file "$setfileurl" "file.7z"

    7z x file.7z
    rm file.7z
    cd
    if [ ! -e "/storage/emulated/0/VM/"$setname"/"$diskfilename"" ]; then
        clear
        echo -e "\e[1;37m[!] Unable to download"
        echo -e "\e[1;37m-\e[0m"
        if [[ "$setfileurl" =~ "archive.org" ]]; then
            echo -e "\e[1;37mThis item may be restricted by the Internet Archive. You can try downloading it manually as follows:"
            echo -e "\e[1;37m[1] Open your browser and go to https://archive.org/ ."
            echo -e "\e[1;37m[2] Sign in or create a new account."
            echo -e "\e[1;37m[3] Open this link on your browser to start the download:"
            echo -e "\e[1;37m-\e[0m"
            echo -e "\e[1;37m$setfileurl"
            echo -e "\e[1;37m-\e[0m"
            echo -e "\e[1;37m[4] Extract the downloaded file into $setname folder in VM folder on your phone (Internal storage/VM/$setname)."
            echo -e "\e[1;37m[5] Run this setup command again."
            echo -e "\e[1;37m-"
            echo -e "\e[1;37mIf the Internet Archive still won't allow the file download or says it's not available, the item may be blocked in your area. Join our community for help here: https://anbui.ovh/community ."
        else
            if [[ "$setfileurl" =~ "pixeldrain" ]]; then
                echo -e "\e[1;37mSince this server limits you to a total of 6GB of downloads per day or this item is restricted, this may have caused the download to fail. You can try again now or tomorrow."
                echo -e "\e[1;37m-\e[0m"
                echo -e "\e[1;37mOr join our community for help here: https://anbui.ovh/community ."
            else
                echo -e "\e[1;37mPlease try again later or join our community for help here: https://anbui.ovh/community ."
            fi
        fi
        if [ -z "$setfileurl2" ]; then
            rm "setup1.sh"
            rm "setup2.sh"
            exit
        else
            setfileurl=$setfileurl2
        fi
    fi
fi
clear
if [ ! -e "/storage/emulated/0/VM/"$setname"/"$diskfilename"" ]; then
    echo -e "\e[1;37m[!] Unable to download"
    echo -e "\e[1;37m-\e[0m"
    echo -e "\e[1;37mTrying again...\e[0m"
    sleep 2
    clear
    echo -e '\e[1;37m[i] Downloading disk image...\e[0m'
    echo -e "\e[1;37m-\e[0m"
    if [[ "$setfileurl" == *"pixeldrain"* || "$setfileurl" == *"google"* ]]; then
        echo -e "\e[1;37m[i] Downloading from high speed server."
    else
        if [[ "$setfileurl" == *"anbui.ovh"* ]]; then
            echo -e "\e[1;37m[i] You are downloading from my test server."
        else
            echo -e "\e[1;37m[!] Downloading from slow speed server."
        fi
    fi
    echo -e "\e[1;37m-\e[0m"
    cd /storage/emulated/0/VM/$setname

    download_file "$setfileurl" "file.7z"

    7z x file.7z
    rm file.7z
    cd
    if [ ! -e "/storage/emulated/0/VM/"$setname"/"$diskfilename"" ]; then
        if [ -z "$setfileurl3" ]; then
            if [[ "$setfileurl" == *"anbui.ovh"* ]]; then
                setfileurl=$setfileurl1
            fi
        fi
        clear
        echo -e "\e[1;37m[!] Unable to download"
        echo -e "\e[1;37m-\e[0m"
        if [[ "$setfileurl" =~ "archive.org" ]]; then
            echo -e "\e[1;37mThis item may be restricted by the Internet Archive. You can try downloading it manually as follows:"
            echo -e "\e[1;37m[1] Open your browser and go to https://archive.org/ ."
            echo -e "\e[1;37m[2] Sign in or create a new account."
            echo -e "\e[1;37m[3] Open this link on your browser to start the download:"
            echo -e "\e[1;37m-\e[0m"
            echo -e "\e[1;37m$setfileurl"
            echo -e "\e[1;37m-\e[0m"
            echo -e "\e[1;37m[4] Extract the downloaded file into $setname folder in VM folder on your phone (Internal storage/VM/$setname)."
            echo -e "\e[1;37m[5] Run this setup command again."
            echo -e "\e[1;37m-"
            echo -e "\e[1;37mIf the Internet Archive still won't allow the file download or says it's not available, the item may be blocked in your area. Join our community for help here: https://anbui.ovh/community ."
        else
            if [[ "$setfileurl" =~ "pixeldrain" ]]; then
                echo -e "\e[1;37mSince this server limits you to a total of 6GB of downloads per day or this item is restricted, this may have caused the download to fail. You can try again now or tomorrow."
                echo -e "\e[1;37m-\e[0m"
                echo -e "\e[1;37mOr join our community for help here: https://anbui.ovh/community ."
            else
                echo -e "\e[1;37mPlease try again later or join our community for help here: https://anbui.ovh/community ."
            fi
        fi
        if [ -z "$setfileurl3" ]; then
            rm "setup1.sh"
            rm "setup2.sh"
            exit
        else
            setfileurl=$setfileurl3
        fi
    fi
fi
clear
if [ ! -e "/storage/emulated/0/VM/"$setname"/"$diskfilename"" ]; then
    echo -e "\e[1;37m[!] Unable to download"
    echo -e "\e[1;37m-\e[0m"
    echo -e "\e[1;37mTrying again...\e[0m"
    sleep 2
    clear
    echo -e '\e[1;37m[i] Downloading disk image...\e[0m'
    echo -e "\e[1;37m-\e[0m"
    if [[ "$setfileurl" == *"pixeldrain"* || "$setfileurl" == *"google"* ]]; then
        echo -e "\e[1;37m[i] Downloading from high speed server."
    else
        if [[ "$setfileurl" == *"anbui.ovh"* ]]; then
            echo -e "\e[1;37m[i] You are downloading from my test server."
        else
            echo -e "\e[1;37m[!] Downloading from slow speed server."
        fi
    fi
    echo -e "\e[1;37m-\e[0m"
    cd /storage/emulated/0/VM/$setname

    download_file "$setfileurl" "file.7z"

    7z x file.7z
    rm file.7z
    cd
    if [ ! -e "/storage/emulated/0/VM/"$setname"/"$diskfilename"" ]; then
        if [[ "$setfileurl" == *"anbui.ovh"* ]]; then
            setfileurl=$setfileurl2
        fi
        clear
        echo -e "\e[1;37m[!] Unable to download"
        echo -e "\e[1;37m-\e[0m"
        if [[ "$setfileurl" =~ "archive.org" ]]; then
            echo -e "\e[1;37mThis item may be restricted by the Internet Archive. You can try downloading it manually as follows:"
            echo -e "\e[1;37m[1] Open your browser and go to https://archive.org/ ."
            echo -e "\e[1;37m[2] Sign in or create a new account."
            echo -e "\e[1;37m[3] Open this link on your browser to start the download:"
            echo -e "\e[1;37m-\e[0m"
            echo -e "\e[1;37m$setfileurl"
            echo -e "\e[1;37m-\e[0m"
            echo -e "\e[1;37m[4] Extract the downloaded file into $setname folder in VM folder on your phone (Internal storage/VM/$setname)."
            echo -e "\e[1;37m[5] Run this setup command again."
            echo -e "\e[1;37m-"
            echo -e "\e[1;37mIf the Internet Archive still won't allow the file download or says it's not available, the item may be blocked in your area. Join our community for help here: https://anbui.ovh/community ."
        else
            if [[ "$setfileurl" =~ "pixeldrain" ]]; then
                echo -e "\e[1;37mSince this server limits you to a total of 6GB of downloads per day or this item is restricted, this may have caused the download to fail. You can try again now or tomorrow."
                echo -e "\e[1;37m-\e[0m"
                echo -e "\e[1;37mOr join our community for help here: https://anbui.ovh/community ."
            else
                echo -e "\e[1;37mPlease try again later or join our community for help here: https://anbui.ovh/community ."
            fi
        fi
        rm "setup1.sh"
        rm "setup2.sh"
        exit
    fi
fi
clear
echo -e '\e[1;37m[i] Installing Debian...\e[0m'
if [[ "$prootdistroname" == "debian" ]]; then
    proot-distro install debian
else
    cd $PREFIX/etc/proot-distro
    aria2c "https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/proot-distro/"$prootdistroname".sh"
    cd
    proot-distro install "$prootdistroname"
fi
clear
echo -e '\e[1;37m[i] Just a sec...\e[0m'
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/"$prootdistroname"/root
curl -o "setup"$setname".sh" https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupqemu/setupqemuvm2.sh
chmod +rwx "setup"$setname".sh"
sed -i -e "1inotes='"$notes"'" setup"$setname".sh
sed -i -e "1isetfileurl3='"$setfileurl3"'" setup"$setname".sh
sed -i -e "1isetfileurl2='"$setfileurl2"'" setup"$setname".sh
sed -i -e "1isetfileurl='"$setfileurl"'" setup"$setname".sh
sed -i -e "1idiskfilename="$diskfilename"" setup"$setname".sh
sed -i -e "1isetname="$setname"" setup"$setname".sh
sed -i -e "1iosname='"$osname"'" setup"$setname".sh
architecture=$(uname -m)
if [[ "$architecture" =~ "64" ]]; then
    finalqemucommand="$setqemucommand"
else
    finalqemucommand="${setqemucommand//-accel tcg,thread=multi/-accel tcg,thread=single}"
fi
echo $finalqemucommand > "start"$setname"vm.sh"
echo "$finalqemucommand -drive file=fat:rw:/storage/emulated/0/VM/Shared" > "start"$setname"vms.sh"
chmod +rwx "start"$setname"vm.sh"
chmod +rwx "start"$setname"vms.sh"
cd ../
echo "/root/setup"$setname".sh" >> ./etc/profile
cd
echo 'sed -i "/start"$setname"/d" /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/"$prootdistroname"/etc/profile' > "start"$setname".sh"
echo 'pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1' >> start"$setname".sh
echo "echo '/root/start"$setname".sh' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/"$prootdistroname"/etc/profile" >> start"$setname".sh
echo "proot-distro login "$prootdistroname"" >> start"$setname".sh
chmod +rwx start"$setname".sh
unset forceqemu7
clear
echo -e '\e[1;37m[i] Login to Debian...\e[0m'
proot-distro login "$prootdistroname"
rm /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/"$prootdistroname"/root/setup"$setname".sh
