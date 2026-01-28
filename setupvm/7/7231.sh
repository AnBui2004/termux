cd
setname='77231'
diskfilename='W77231.vhd'
#setfileurl='https://pixeldrain.com/api/file/rrRuhnv7?download'
setfileurl='https://archive.org/download/windows-7-build-7231.7znbab/Windows%207%20build%207231.7z'
setfileurl2='https://go.anbui.ovh/termux/qemu/windows/nt6/Windows%207%20build%207231.7z'
setqemucommand='qemu-system-x86_64 -usb -device usb-tablet -device usb-kbd -cpu qemu64 -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/77231/W77231.vhd,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device intel-hda -device hda-duplex -device e1000,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -monitor stdio -vnc :2 -rtc base=2009-06-08t00:00:00'
osname="Windows_7_build_7231"
distro="debian-bookworm"
export distro
export setname
export diskfilename
export setfileurl
export setfileurl2
#export setfileurl3
export setqemucommand
export osname