apt update
apt upgrade -y
pkg install x11-repo termux-am termux-tools -y
termux-setup-storage
pkg install proot-distro -y
proot-distro install debian
proot-distro login debian