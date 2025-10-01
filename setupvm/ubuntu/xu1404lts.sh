cd
setname='xu1404'
diskfilename='XU14045LTS.qcow2'
setfileurl='https://pixeldrain.com/api/file/iJygd6Jr?download'
setfileurl2='https://archive.org/download/xubuntu-14.04.5-lts.-7znbab/Xubuntu%2014.04.5%20LTS.7z'
setfileurl3='https://go.anbui.ovh/termux/qemu/linux/ubuntu/Xubuntu%2014.04.5%20LTS.7z'
setqemucommand='qemu-system-x86_64 -M pc -device qemu-xhci -device usb-tablet -device usb-kbd -device qemu-xhci -cpu core2duo -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/xu1404/XU14045LTS.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128,ram_size_mb=128,vram64_size_mb=128 -device ich9-intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -device virtio-balloon-pci -monitor stdio -vnc :2'
osname="Xubuntu_14.04.5_LTS"
notes="https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupvm/ubuntu/xu1404.txt"
distro="debian-bookworm"
export distro
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname
#User: nguyen
#Password: qwerty13579.