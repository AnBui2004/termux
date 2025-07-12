cd
setname='87785'
diskfilename='W87785.qcow2'
setfileurl='https://pixeldrain.com/api/file/aG28unRW?download'
setfileurl2='https://archive.org/download/windows-8-build-7785.7znbsb/Windows%208%20build%207785.7z'
setfileurl3='https://go.anbui.ovh/termux/qemu/windows/nt6/Windows%208%20build%207785.7z'
setqemucommand='qemu-system-x86_64 -usb -device usb-tablet -device usb-kbd -cpu qemu64 -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/87785/W87785.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device ich9-intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -rtc base=2010-07-21t00:00:00 -drive file=/storage/emulated/0/VM/87785/OVMF.fd,format=raw,readonly=on,if=pflash -drive file=/storage/emulated/0/VM/87785/RELEASEX64_OVMF_VARS.fd,format=raw,if=pflash -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -monitor stdio -vnc :2'
osname="Windows_8_build_7785"
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname