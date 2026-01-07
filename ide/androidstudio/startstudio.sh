if [ -L "$HOME/Android/Sdk/platform-tools/adb" ]; then
    mkdir -p $HOME/Android/Sdk/platform-tools
    cd $HOME/Android/Sdk/platform-tools
    cp adb adb.bak
    ln -s /usr/bin/adb ./adb
    chmod -w ./adb
fi
sed -i "/startstudio.sh/d" $HOME/.profile
clear
getpermisionsdcard=$(ls -l /sdcard/)
if [ "$getpermisionsdcard" == "" ]; then
echo -e "\e[1;37m[!] You should grant access to storage on this device."
echo -e "\e[1;37m--------------------"
echo ""
fi
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37mDo you want to run Android Studio now? Enter the corresponding number and press enter to start. Enter nothing and press enter to exit and continue using Debian."
echo -e "\e[1;37m--------------------"
echo -e "\e[1;37m1. Run now"
echo -e "\e[1;37m2. Tips"
echo -e "\e[1;37m3. Uninstall"
echo -e "\e[1;37mOther. Exit"
echo -e "\e[1;37m--------------------"
read -n 1 option

case "$option" in
    '1')
        clear
        echo -e "\e[1;37m[i] Android Studio is running..."
        /Apps/IDE/android-studio/studio.sh
        /Apps/IDE/android-studio/startstudio.sh
        ;;
    '2')
        echo -e "\e[1;37m[i] Tips"
        echo -e '\e[1;37m----------\e[0m'
        echo -e '\e[1;37mJava:\e[0m'
        echo -e '\e[1;37mOn first launch, Gradle may not work due to a Java issue. To fix this, go to File > Settings > Build, Execution, Deployment > Build Tools > Gradle > Gradle JDK > Download JDK, select a Java version, and click the Download button. Wait until the download is complete, Android Studio may close automatically and you will need to reopen it.\e[0m'
        echo ""
        echo -e '\e[1;37m----\e[0m'
        echo ""
        echo -e '\e[1;37mAAPT2:\e[0m'
        echo -e '\e[1;37mSince Android Studio always downloads AAPT2 for x86_64, if your device is ARM, add this line to your project's gradle.properties to force it to use Debian's ARM AAPT2:\e[0m'
        echo ""
        echo -e '\e[1;37mandroid.aapt2FromMavenOverride=/usr/bin/aapt2\e[0m'
        echo ""
        echo ""
        echo -e '\e[1;37m-----\e[0m'
        echo ""
        echo -e '\e[1;37mADB:\e[0m'
        echo -e '\e[1;37mThe ADB that Android Studio downloaded did not work with ARM and was automatically fixed. If you changed the SDK directory, run this command in the platform-tools directory to fix it:\e[0m'
        echo ""
        echo -e '\e[1;37mcp adb adb.bak && ln -s /usr/bin/adb ./adb\e[0m'
        echo ""
        echo ""
        echo -e '\e[1;37m----------\e[0m'
        echo -e '\e[1;37mPress any key to exit.\e[0m'
        read -n 1 optiontemp
        /Apps/IDE/android-studio/startstudio.sh
        ;;
    '3')
        /Apps/IDE/android-studio/uninstall.sh
        ;;
    *)
        clear
        echo -e "\e[1;37mExiting..."
        ;;
esac
clear