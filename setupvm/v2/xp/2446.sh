cd
setname='ww2446'
diskfilename='WW2446.qcow2'
setfileurl='http://192.168.1.110/Windows%20Whistler%20build%202446.7z'
setfileurl2=''
setfileurl3=''
setqemucommand='qemu-system-x86_64 -M hpet=off -usb -device usb-tablet -device usb-kbd -cpu qemu32 -smp 2 -m 512M -drive file=/storage/emulated/0/VM/ww2446/WW2446.qcow2,cache=writeback,l2-cache-size=256M,aio=threads,discard=unmap -vga std -device ac97 -device rtl8139,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -rtc base=2001-03-01t12:00:00 -monitor stdio -vnc :2'
osname="Windows_Whistler_build_2446"
export distro
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname