clear
echo "The owner of these scripts will not be responsible for any unintended problems that may occur whether you edit these scripts or not. It will start in 10 seconds and you have agreed to this. To cancel press Ctrl + C."
sleep 10
clear
curl "https://firebasestorage.googleapis.com/v0/b/chromium-a120a.appspot.com/o/termux%2Frish?alt=media&token=ea22ed0c-6312-4c95-9121-d7e5392d3e31" -o rish
curl "https://firebasestorage.googleapis.com/v0/b/chromium-a120a.appspot.com/o/termux%2Frish_shizuku.dex?alt=media&token=4e72a95a-57fc-4ce8-9cf0-5afb2342326c" -o rish_shizuku.dex
chmod +rwx rish
chmod +rwx rish_shizuku.dex