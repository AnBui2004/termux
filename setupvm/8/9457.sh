cd
setname='819457'
diskfilename='W819457.qcow2'
setfileurl='http://192.168.1.110/Windows%208.1%20build%209457.7z'
setfileurl2=''
setfileurl3=''
setqemucommand='qemu-system-x86_64 -M q35 -device qemu-xhci -device usb-tablet -device usb-kbd -cpu qemu64,+avx,+avx2,+sse,+sse2,+sse4.1,+sse4.2,hv-relaxed -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/sdcard/VM/819457/W819457.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device ich9-intel-hda -device hda-duplex -device e1000e,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -drive file=/sdcard/VM/819457/OVMF.fd,format=raw,readonly=on,if=pflash -drive file=/sdcard/VM/819457/RELEASEX64_OVMF_VARS.fd,format=raw,if=pflash -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -device intel-iommu -rtc base=2013-07-08t00:00:00 -monitor stdio -vnc :2'
osname="Windows_8.1_build_9457"
distro="debian"
export distro
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname