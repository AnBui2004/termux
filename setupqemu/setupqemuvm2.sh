clear
echo -e '\e[1;37m[i] Installing packages...\e[0m'
sed -i "/setup"$setname"/d" /etc/profile
apt update
apt upgrade -y
apt install pulseaudio tightvncserver qemu-system-x86 -y
export PULSE_SERVER=127.0.0.1
clear
echo -e '\e[1;37m[i] Just a sec...\e[0m'
if [ -e "/storage/emulated/0/VM/"$setname"/"$diskfilename"" ]; then
    cd
    curl -o "start"$setname".sh" https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupqemu/startqemuvm.sh
    chmod +rwx "start"$setname".sh"

    # Use a loop to insert variables into the script
    declare -A variables=(
        [setfileurl3]="$setfileurl3"
        [setfileurl2]="$setfileurl2"
        [setfileurl]="$setfileurl"
        [setname]="$setname"
        [osname]="$osname"
    )

    for key in "${!variables[@]}"; do
        sed -i -e "1i$key='${variables[$key]}'" "start"$setname".sh"
    done

    clear
    echo -e '\e[1;37m[i] Done!\e[0m'
    echo -e '\e[1;37m-\e[0m'
    echo -e "\e[1;37mUse this command to run: \"./start"$setname".sh\"\e[0m"
    echo -e '\e[1;37m-\e[0m'
    echo -e '\e[1;37mThe necessary files are in the VM folder on your phone. Please do not delete the files there if you still use them.\e[0m'
    echo -e '\e[1;37m-\e[0m'
    if [ -n "$notes" ]; then
        echo ""
        curl $notes
        echo ""
    fi
else
    sed -i "/start"$setname"/d" /etc/profile
    cd
    rm start"$setname"vm.sh
    rm -r /storage/emulated/0/VM/"$setname"
    rm start"$setname".sh
    rm /data/data/com.termux/files/home/start"$setname".sh
    clear
    echo -e "\e[0;33m[!] Unsuccessful!"
    echo -e "\e[1;37m-\e[0m"
    echo -e "\e[91mError! An error occurred. Please try again later."
fi
rm "setup"$setname".sh"
rm "/data/data/com.termux/files/home/setup1.sh"
rm "/data/data/com.termux/files/home/setup2.sh"
exit