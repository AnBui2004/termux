cd
setname='109926'
diskfilename='W109926.qcow2'
setfileurl='https://pixeldrain.com/api/file/WbE3u6y2?download'
setfileurl2='https://archive.org/download/windows-10-build-9926.7znbab/Windows%2010%20build%209926.7z'
setfileurl3='https://go.anbui.ovh/termux/qemu/windows/nt10/Windows%2010%20build%209926.7z'
setqemucommand='qemu-system-x86_64 -device qemu-xhci -device usb-tablet -device usb-kbd -cpu qemu64 -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/109926/W109926.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device ich9-intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -drive file=/storage/emulated/0/VM/109926/OVMF.fd,format=raw,readonly=on,if=pflash -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -monitor stdio -vnc :2'
osname="Windows_10_build_9926"
export setname
forceqemu7='1'
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname