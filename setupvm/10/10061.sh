cd
setname='1010061'
diskfilename='W1010061.qcow2'
setfileurl='https://pixeldrain.com/api/file/VvnXq5X2?download'
setfileurl2='https://archive.org/download/windows-10-build-10061.7znbab/Windows%2010%20build%2010061.7z'
setfileurl3='https://go.anbui.ovh/termux/qemu/windows/nt10/Windows%2010%20build%2010061.7z'
setqemucommand='qemu-system-x86_64 -usb -device usb-tablet -device usb-kbd -cpu qemu64 -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/1010061/W1010061.qcow2,aio=threads,cache=unsafe,if=none,id=hda -device virtio-blk-pci,drive=hda -device qxl-vga,vgamem_mb=128 -device ich9-intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -rtc base=2015-04-10t00:00:00 -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -monitor stdio -vnc :2'
osname="Windows_10_build_10061"
distro="debian-bookworm"
export distro
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname