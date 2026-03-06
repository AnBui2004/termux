cd
setname='wl4051'
diskfilename='WL4051.qcow2'
setfileurl='https://pixeldrain.com/api/file/WWd2DCfi?download'
setfileurl2='https://archive.org/download/windows-longhorn-4051.7znbab/Windows%20Longhorn%204051.7z'
setfileurl3='https://go.anbui.ovh/termux/qemu/windows/nt6/Windows%20Longhorn%204051.7z'
setqemucommand='qemu-system-x86_64 -usb -device usb-tablet -device usb-kbd -cpu core2duo -smp sockets=1,cores=2,threads=1 -overcommit mem-lock=off -m 1024M -drive file=/sdcard/VM/wl4051/WL4051.qcow2,aio=threads,cache=unsafe -vga cirrus -device ac97 -device rtl8139,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -monitor stdio -vnc :2 -rtc base=2003-10-01t00:00:00'
osname="Windows_Longhorn_4051"
distro="debian"
export distro
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname