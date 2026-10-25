#!/bin/bash
CURRENT_USER=$(whoami)
OS_INFO=$(cat /etc/os-release)
if [[ "$CURRENT_USER" == "devroom" && "$OS_INFO" =~ "ID=debian" ]]; then
    PROCESSES_INFO=$(ps -e -u devroom)
    if [[ "$PROCESSES_INFO" =~ "antigravity-ide" ]]; then
        /Apps/IDE/AntigravityIDE/antigravityide.sh
    else
        /Apps/IDE/AntigravityIDE/startantigravityide.sh
    fi
elif [[ "$OS_INFO" =~ "ID=debian" ]]; then
    sed -i "/startantigravityide.sh/d" /home/devroom/.profile
    echo "/Apps/IDE/AntigravityIDE/startantigravityide.sh" >> /home/devroom/.profile
    clear
    su - devroom
    sed -i "/startantigravityide.sh/d" /home/devroom/.profile
    clear
else
    if [ -z "$PREFIX" ]; then
        PREFIX=/data/data/com.termux/files/usr
    fi
    sed -i "/startantigravityide.sh/d" $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs/home/devroom/.profile
    echo "/Apps/IDE/AntigravityIDE/startantigravityide.sh" >> $PREFIX/var/lib/proot-distro/containers/debiandevroom/rootfs/home/devroom/.profile
    clear
    proot-distro login debiandevroom --user devroom
    clear
fi