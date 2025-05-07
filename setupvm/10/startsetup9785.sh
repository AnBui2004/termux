cd
setname='109785'
diskfilename='W109785.qcow2'
setfileurl='https://pixeldrain.com/api/file/Cg5Dq5zf?download'
setfileurl2='https://archive.org/download/windows-10-build-9785.7z/Windows%2010%20build%209785.7z'
setfileurl3='https://go.anbui.ovh/termux/qemu/windows/nt6/Windows%2010%20build%209785.7z'
setqemucommand='qemu-system-x86_64 -M pc -device qemu-xhci -device usb-tablet -device usb-kbd -cpu qemu64 -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/109785/W109785.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device ich9-intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -monitor stdio -vnc :2'
osname="Windows_10_build_9785"
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname