clear
echo -e '\e[1;37mInstalling packages...\e[0m'
curl -o installqemu.sh https://raw.githubusercontent.com/AnBui2004/termux/main/installqemu.sh
chmod +rwx installqemu.sh
./installqemu.sh
rm installqemu.sh
pkg install p7zip -y
clear
echo -e '\e[1;37mDownloading file...\e[0m'
wget https://github.com/AnBui2004/termux/raw/refs/heads/main/OVMF.fd
wget -O a.7z https://archive.org/download/windows-11.7z_202410/Windows%2011.7z
7z x a.7z
mkdir /storage/emulated/0/VM
chmod +rwx /storage/emulated/0/VM
mv OVMF.fd /storage/emulated/0/VM
mv W11.qcow2 /storage/emulated/0/VM
rm a.7z
clear
echo -e '\e[1;37mJust a moment...\e[0m'
echo qemu-system-x86_64 -M q35,hmat=on -usb -device usb-tablet -device usb-kbd -cpu qemu64,+avx,+avx-ifma,+avx-ne-convert,+avx-vnni,+avx-vnni-int8,+avx2,+avx512-4fmaps,+avx512-4vnniw,+avx512-bf16,+avx512-fp16,+avx512-vp2intersect,+avx512-vpopcntdq,+avx512bitalg,+avx512bw,+avx512cd,+avx512dq,+avx512er,+avx512f,+avx512ifma,+avx512pf,+avx512vbmi,+avx512vbmi2,+avx512vl,+avx512vnni,+sse,+sse2,+sse4.1,+sse4.2 -smp sockets=1,cores=6,threads=1 -m 4096M -overcommit mem-lock=off -drive file=/storage/emulated/0/VM/W11.qcow2,aio=threads,cache=unsafe,if=none,id=hda -device virtio-blk-pci,drive=hda -vga none -device virtio-gpu-pci,max_hostmem=128M -device intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -bios /storage/emulated/0/VM/OVMF.fd -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -device intel-iommu -vnc :2 > start11.sh
chmod +rwx start11.sh
clear
echo -e '\e[1;37mDone!\e[0m'
echo -e '\e[1;37mUse this command to run: "./start11.sh"\e[0m'
echo -e '\e[1;37m----------\e[0m'
echo -e '\e[1;37mThe necessary files are in the VM folder on your phone. Please do not delete the files there if you still use them.\e[0m'
