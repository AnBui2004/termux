cd
setname='wv53844'
diskfilename='WV5384.4.qcow2'
setfileurl='http://192.168.1.110/termux/qemu/windows/nt6/Windows%20Vista%205384.4.7z'
setfileurl2=''
setfileurl3=''
setqemucommand='qemu-system-x86_64 -usb -device usb-tablet -device usb-kbd -cpu core2duo -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M -drive file=/storage/emulated/0/VM/WV53844/WV5384.4.qcow2,aio=threads,cache=unsafe -vga std -device ac97 -device e1000,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -monitor stdio -vnc :2 -rtc base=2006-05-18t00:00:00'
osname="Windows_Vista_build_5384.4"
distro="debian"
export distro
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname