cd
setname='wce6'
diskfilename='WCE60.vhd'
setfileurl='http://192.168.1.111:8080/api/Windows%20CE%206.0.7z'
setfileurl2=''
setfileurl3=''
setqemucommand='qemu-system-x86_64 -usb -cpu pentium3 -smp sockets=1,cores=1,threads=1 -overcommit mem-lock=off -m 128M -hda /storage/emulated/0/VM/wce6/WCE60.vhd -vga cirrus -device sb16 -device e1000-82544gc,netdev=n0 -netdev user,id=n0 -accel tcg,thread=single,tb-size=1024 -monitor stdio -vnc :2'
osname="Windows_CE_6.0"
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname