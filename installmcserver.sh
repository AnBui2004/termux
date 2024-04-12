echo -e "\e[1;33mUpdating..."
apt update
apt upgrade -y

echo -e "\e[1;33mInstalling packages..."
pkg install x11-repo
pkg install wget -y
pkg install openjdk-17 -y
pkg install nano -y

echo -e "\e[1;33mhttps://github.com/AnBui2004"
echo -e "\e[1;33mStart setup!"
read -p $'\e[96mEnter the download link for the version of Minecraft Server you want to use: \e[0m' link

read -p $'\e[96mHow much device memory do you want Minecraft Server to use? (MB): \e[0m' ram

read -p $'\e[96mIn which directory do you want this server to operate? (Does not contain special characters and spaces): \e[0m' folder

echo -e "\e[1;33mCreating sh files..."
echo "cd "$folder"
java -Xmx"$ram"M -Xms"$ram"M -jar server.jar" > "$folder".sh
chmod +x "$folder".sh

echo "cd "$folder"
nano server.properties" > "$folder"p.sh
chmod +x "$folder"p.sh

echo "rm -r "$folder"
rm "$folder".sh
rm "$folder"p.sh
rm rm"$folder".sh" > rm"$folder".sh
chmod +x rm"$folder".sh

echo -e "\e[1;33mCreating directory for the server..."
mkdir "$folder"
chmod +rwx "$folder"
cd "$folder"

echo -e "\e[1;33mDownloading server.jar..."
wget -O server.jar "$link"
echo eula=true > eula.txt
cd
clear
myip=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && myip=$ip
  done< <(LANG=C ifconfig)
echo -e "\e[1;33mAddress to connect to the server once it is running:
"$myip":25565"
echo -e "\e[0;37m--------------------"
echo -e "\e[0;32mBy running this server using any method, you have agreed to Minecraft's End User License Agreement. Read here: https://www.minecraft.net/en-us/eula"
echo -e "\e[0;37m--------------------"
echo -e "\e[96mUse this command to run server now: ./"$folder".sh"
echo -e "\e[1;33mUse this command to edit server.properties: ./"$folder"p.sh"
echo -e "\e[1;33mUse this command to stop the server while it is running: /stop"
echo -e "\e[0;31mUse this command to delete server: ./rm"$folder".sh"
