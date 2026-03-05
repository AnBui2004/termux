cd
setname='wl4051'
diskfilename='WL4051.qcow2'
setfileurl='http://192.168.1.110/Windows%20Longhorn%204051.7z'
setfileurl=''
setfileurl2=''
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