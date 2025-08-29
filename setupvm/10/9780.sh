cd
setname='109780'
diskfilename='W109780.vhd'
setfileurl='https://pixeldrain.com/api/file/vK4yuenN?download'
setfileurl2='https://archive.org/download/windows-10-build-9780.7znbab/Windows%2010%20build%209780.7z'
setfileurl3='https://go.anbui.ovh/termux/qemu/windows/nt6/Windows%2010%20build%209780.7z'
setqemucommand='qemu-system-x86_64 -M q35 -device qemu-xhci -device usb-tablet -device usb-kbd -cpu qemu64 -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/109780/W109780.vhd,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device ich9-intel-hda -device hda-duplex -device e1000e,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -rtc base=2014-06-22t00:00:00 -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -device intel-iommu -monitor stdio -vnc :2'
osname="Windows_10_build_9780"
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname