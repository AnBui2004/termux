cd
setname='109841'
diskfilename='W109841.qcow2'
#setfileurl='https://pixeldrain.com/api/file/A6EE4B7z?download'
setfileurl='https://archive.org/download/w-109841.7znbab/W109841.7z'
setqemucommand='qemu-system-x86_64 -M q35 -device qemu-xhci -device usb-tablet -device usb-kbd -cpu qemu64,+avx,+avx2,+sse,+sse2,+sse4.1,+sse4.2,hv-relaxed -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/109841/W109841.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device ich9-intel-hda -device hda-duplex -device e1000e,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -device intel-iommu -monitor stdio -vnc :2'
osname="Windows_10_build_9841"
distro="debian-bookworm"
export distro
export setname
export diskfilename
export setfileurl
#export setfileurl2
export setqemucommand
export osname