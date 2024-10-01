pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
echo -e '\e[1;37mPulseaudio is running...\e[0m'
