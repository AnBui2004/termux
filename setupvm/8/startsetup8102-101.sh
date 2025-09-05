cd
setname='88102'
diskfilename='W88102.qcow2'
#setfileurl='https://pixeldrain.com/api/file/3xNBDbLH?download'
setfileurl='https://archive.org/download/windows-8-build-8102.101.7znbab/Windows%208%20build%208102.101.7z'
setfileurl2='https://go.anbui.ovh/termux/qemu/windows/nt6/Windows%208%20build%208102.101.7z'
setqemucommand='qemu-system-x86_64 -M pc -device qemu-xhci -device usb-tablet -device usb-kbd -cpu qemu64,+avx,+avx2,+sse,+sse2,+sse4.1,+sse4.2 -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/88102/W88102.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device ich9-intel-hda -device hda-duplex -device e1000e,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -monitor stdio -vnc :2'
osname="Windows_8_build_8102_101"
export setname
forceqemu7='1'
export diskfilename
export setfileurl
export setfileurl2
#export setfileurl3
export setqemucommand
export osname