cd
setname='wl4001'
diskfilename='WL4001.qcow2'
setfileurl='http://192.168.1.188/termux/qemu/windows/nt6/Windows%20Longhorn%204001.7z'
setfileurl2=''
setfileurl3=''
setqemucommand='qemu-system-x86_64 -usb -device usb-tablet -device usb-kbd -cpu pentium3 -smp sockets=1,cores=1,threads=1 -overcommit mem-lock=off -m 1024M -drive file=/storage/emulated/0/VM/wl4001/WL4001.qcow2,aio=threads,cache=unsafe -vga cirrus -device ac97 -device rtl8139,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -monitor stdio -vnc :2 -rtc base=2002-12-04t00:00:00'
osname="Windows_Longhorn_4001"
distro="debian-bookworm"
export distro
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname