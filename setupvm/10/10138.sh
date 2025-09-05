cd
setname='1010138'
diskfilename='W1010138.qcow2'
setfileurl='https://pixeldrain.com/api/file/XmVYxDVK?download'
setfileurl2='https://archive.org/download/windows-10-build-10138.7znbab/Windows%2010%20build%2010138.7z'
setfileurl3='https://go.anbui.ovh/termux/qemu/windows/nt10/Windows%2010%20build%2010138.7z'
setqemucommand='qemu-system-x86_64 -M q35 -device qemu-xhci -device usb-tablet -device usb-kbd -cpu qemu64 -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/1010138/W1010138.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device virtio-gpu-pci -device ich9-intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -rtc base=2015-06-03t00:00:00 -drive file=/storage/emulated/0/VM/1010138/OVMF.fd,format=raw,readonly=on,if=pflash -drive file=/storage/emulated/0/VM/1010138/RELEASEX64_OVMF_VARS.fd,format=raw,if=pflash -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -device intel-iommu -monitor stdio -vnc :2'
osname="Windows_10_build_10138"
export setname
forceqemu7='1'
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname