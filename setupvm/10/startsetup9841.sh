cd
setname='109841'
diskfilename='W109841.qcow2'
setfileurl='https://www.googleapis.com/drive/v3/files/1u3o6qA5YAORpSss44n1Qrt86BA4ibjGY?alt=media&key=AIzaSyBg5cJ4QZF7kDgco9Sxrs-cPtV3F65bVSY'
setqemucommand='qemu-system-x86_64 -M q35 -device qemu-xhci -device usb-tablet -device usb-kbd -cpu qemu64,+avx,+avx2,+sse,+sse2,+sse4.1,+sse4.2,hv-relaxed -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/109841/W109841.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device ich9-intel-hda -device hda-duplex -device e1000e,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -device intel-iommu -monitor stdio -vnc :2'
osname="Windows_10_build_9841"
export setname
export diskfilename
export setfileurl
export setqemucommand
export osname