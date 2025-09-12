cd
setname='1010041'
diskfilename='W1010041.qcow2'
setfileurl='https://pixeldrain.com/api/file/7Hj27Xg6?download'
setfileurl2='https://archive.org/download/windows-10-build-10041.7znbab/Windows%2010%20build%2010041.7z'
setfileurl3='https://go.anbui.ovh/termux/qemu/windows/nt10/Windows%2010%20build%2010041.7z'
setqemucommand='qemu-system-x86_64 -M q35 -device qemu-xhci -device usb-tablet -device usb-kbd -cpu core2duo -smp sockets=1,cores=2,threads=1 -m 4096M -drive file=/storage/emulated/0/VM/1010041/W1010041.qcow2,aio=threads,cache=unsafe -device ich9-intel-hda -device hda-duplex -device e1000e,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -rtc base=2015-03-13t00:00:00 -device intel-iommu -monitor stdio -vnc :2'
osname="Windows_10_build_10041"
distro="debian-bookworm"
export distro
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname