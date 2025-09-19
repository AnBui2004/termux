cd
setname='88250'
diskfilename='W88250.qcow2'
setfileurl='https://pixeldrain.com/api/file/LdRSwkBM?download'
setfileurl2='https://archive.org/download/windows-8-build-8250.7znbab/Windows%208%20build%208250.7z'
setfileurl3='https://go.anbui.ovh/termux/qemu/windows/nt6/Windows%208%20build%208250.7z'
setqemucommand='qemu-system-x86_64 -device qemu-xhci -device usb-tablet -device usb-kbd -cpu qemu64 -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/88250/W88250.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device ich9-intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -rtc base=2012-02-17t00:00:00 -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -monitor stdio -vnc :2'
osname="Windows_8_build_8250"
distro="debian-bookworm"
export distro
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname