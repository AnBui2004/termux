cd
setname='89431'
diskfilename='W89431.qcow2'
setfileurl='https://pixeldrain.com/api/file/q7w7r3Xx?download'
setfileurl2='https://archive.org/download/windows-8-9431.7znbab/Windows%208%209431.7z'
setfileurl3='https://go.anbui.ovh/termux/qemu/windows/nt6/Windows%208%20build%209431.7z'
setqemucommand='qemu-system-x86_64 -M q35 -device qemu-xhci -device usb-tablet -device usb-kbd -cpu qemu64 -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/89431/W89431.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device virtio-gpu-pci -device ich9-intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -rtc base=2013-06-15t00:00:00 -drive file=/storage/emulated/0/VM/89431/OVMF.fd,format=raw,readonly=on,if=pflash -drive file=/storage/emulated/0/VM/89431/RELEASEX64_OVMF_VARS.fd,format=raw,if=pflash -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -device intel-iommu -monitor stdio -vnc :2'
osname="Windows_8.1_build_9431"
distro="debian-bookworm"
export distro
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname