cd
setname='1125h2'
diskfilename='W1125H2.vhd'
setfileurl='https://pixeldrain.com/api/file/1JYjhe67?download'
setfileurl2='https://archive.org/download/windows-11-25-h-2.7znbab/Windows%2011%2025H2.7z'
setfileurl3='https://go.anbui.ovh/termux/qemu/windows/nt10/Windows%2011%2025H2.7z'
setqemucommand='qemu-system-x86_64 -M q35 -device qemu-xhci -device usb-tablet -device usb-kbd -cpu Nehalem,+avx,+avx2,+sse,+sse2,+sse4.1,+sse4.2,+popcnt -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/1125h2/W1125H2.vhd,aio=threads,cache=unsafe,if=none,id=hda -device virtio-blk-pci,drive=hda -device qxl-vga -device ich9-intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -drive file=/storage/emulated/0/VM/1125h2/OVMF.fd,format=raw,readonly=on,if=pflash -drive file=/storage/emulated/0/VM/1125h2/RELEASEX64_OVMF_VARS.fd,format=raw,if=pflash -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -monitor stdio -vnc :2'
osname="Windows_11_25H2"
distro="debian-bookworm"
export distro
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname