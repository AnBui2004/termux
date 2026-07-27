cd
setname='81'
diskfilename='W81.qcow2'
setfileurl='http://192.168.1.110/Windows%208.1.7z'
setfileurl2=''
setfileurl3=''
setqemucommand='qemu-system-x86_64 -M q35,hpet=off -device qemu-xhci -device usb-tablet -device usb-kbd -cpu core2duo -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/81/W81.qcow2,aio=threads,cache=writeback,l2-cache-size=2M -device qxl-vga,vgamem_mb=128 -device ich9-intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -drive file=/storage/emulated/0/VM/81/edk2-x86_64-code.fd,format=raw,readonly=on,if=pflash -drive file=/storage/emulated/0/VM/81/edk2-i386-vars.fd,format=raw,if=pflash -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -device intel-iommu -monitor stdio -vnc :2'
osname="Windows_8.1"
export distro
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname