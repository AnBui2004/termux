cd
setname='1404lts'
diskfilename='UM1404LTS.qcow2'
setfileurl='http://192.168.1.188/termux/qemu/linux/ubuntu/Ubuntu%20MATE%2014.04%20LTS.7z'
setfileurl2=''
setfileurl3=''
setqemucommand='qemu-system-x86_64 -M pc -device qemu-xhci -device usb-tablet -device usb-kbd -device qemu-xhci -cpu core2duo -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/1404lts/UM1404LTS.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128,ram_size_mb=128,vram64_size_mb=128 -device ich9-intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -device virtio-balloon-pci -monitor stdio -vnc :2'
osname="Ubuntu MATE 14.04 LTS"
notes="https://raw.githubusercontent.com/AnBui2004/termux/refs/heads/main/setupvm/ubuntu/1404lts.txt"
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