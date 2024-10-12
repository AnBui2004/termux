clear
echo -e '\e[1;37mInstalling packages...\e[0m'
apt update
apt upgrade -y
apt install x11-repo -y
apt install proot-distro p7zip wget -y
echo -e '\e[1;37mSetting up Pulseaudio...\e[0m'
curl -o setup.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/installpulseaudio.sh
chmod +rwx setup.sh
./setup.sh
rm setup.sh
echo -e '\e[1;37mDownloading file...\e[0m'
termux-setup-storage
mkdir /storage/emulated/0/VM
chmod +rwx /storage/emulated/0/VM
cd /storage/emulated/0/VM
wget -O a.7z http://192.168.1.111:8080/api/Windows%2010%20IoT%20LTSC%202021.7z
7z x a.7z
rm a.7z
cd
clear
echo -e '\e[1;37mInstalling Debian...\e[0m'
proot-distro install debian
clear
echo -e '\e[1;37mJust a sec...\e[0m'
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root
curl -o setup121024.sh https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupwindows10iotltsc2021two.sh
chmod +rwx setup121024.sh
echo qemu-system-x86_64 -M q35,hmat=on -usb -device usb-tablet -device usb-kbd -cpu qemu64,+avx,+avx-ifma,+avx-ne-convert,+avx-vnni,+avx-vnni-int8,+avx2,+avx512-4fmaps,+avx512-4vnniw,+avx512-bf16,+avx512-fp16,+avx512-vp2intersect,+avx512-vpopcntdq,+avx512bitalg,+avx512bw,+avx512cd,+avx512dq,+avx512er,+avx512f,+avx512ifma,+avx512pf,+avx512vbmi,+avx512vbmi2,+avx512vl,+avx512vnni,+sse,+sse2,+sse4.1,+sse4.2 -smp sockets=1,cores=6,threads=1 -m 4096M -overcommit mem-lock=off -drive file=/storage/emulated/0/VM/W10IoTLTSC2021.qcow2,aio=threads,cache=unsafe,if=none,id=hda -device virtio-blk-pci,drive=hda -vga none -device virtio-gpu-pci,max_hostmem=128M -device intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -device intel-iommu -vnc :2 > start102021vm.sh
chmod +rwx start102021vm.sh
cd ../
echo '/root/setup121024.sh' >> /etc/profile
cd
echo 'proot-distro login debian' > start102021.sh
chmod +rwx start102021.sh
clear
echo -e '\e[1;37mLogin to Debian...\e[0m'
proot-distro login debian