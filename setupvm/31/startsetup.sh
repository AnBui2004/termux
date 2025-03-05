cd
setname='w31'
diskfilename='Windows3.1.vdi'
setfileurl='https://archive.org/download/windows-3.1.7znbab/Windows%203.1.7z'
setqemucommand='
qemu-system-x86_64 -cpu qemu32 -smp sockets=1,cores=1,threads=1 -m 128M -hda /storage/emulated/0/VM/w31/Windows3.1.vdi -vga cirrus -device sb16 -device pcnet,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -monitor stdio -vnc :2'
osname="Windows_3.1"
export setname
export diskfilename
export setfileurl
export setqemucommand
export osname