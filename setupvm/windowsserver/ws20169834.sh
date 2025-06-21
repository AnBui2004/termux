cd
setname='ws20169834'
diskfilename='WS20169834.qcow2'
setfileurl='https://pixeldrain.com/api/file/ixsq3tDK?download'
setfileurl2='https://archive.org/download/windows-server-2016-build-9834.7znbab/Windows%20Server%202016%20build%209834.7z'
setfileurl3='https://go.anbui.ovh/termux/qemu/windows/nt10/Windows%20Server%202016%20build%209834.7z'
setqemucommand='qemu-system-x86_64 -M q35 -usb -device usb-tablet -device usb-kbd -cpu qemu64,+avx,+avx2,+avx512-4fmaps,+avx512-4vnniw,+avx512-bf16,+avx512-fp16,+avx512-vp2intersect,+avx512-vpopcntdq,+avx512bitalg,+avx512bw,+avx512cd,+avx512dq,+avx512er,+avx512f,+avx512ifma,+avx512pf,+avx512vbmi,+avx512vbmi2,+avx512vl,+avx512vnni,+sse,+sse2,+sse4.1,+sse4.2,hv-relaxed -smp sockets=1,cores=4,threads=1 -overcommit mem-lock=off -m 4096M,slots=4,maxmem=4097M -object memory-backend-ram,size=1024M,id=m0 -numa node,nodeid=0,memdev=m0,cpus=0 -object memory-backend-ram,size=1024M,id=m1 -numa node,nodeid=1,memdev=m1,cpus=1 -object memory-backend-ram,size=1024M,id=m2 -numa node,nodeid=2,memdev=m2,cpus=2 -object memory-backend-ram,size=1024M,id=m3 -numa node,nodeid=3,memdev=m3,cpus=3 -drive file=/storage/emulated/0/VM/ws20169834/WS20169834.qcow2,aio=threads,cache=unsafe -device qxl-vga,vgamem_mb=128 -device ich9-intel-hda -device hda-duplex -device virtio-net-pci,netdev=n0 -netdev user,id=n0 -accel tcg,thread=multi,tb-size=2048 -rtc base=2014-09-08t00:00:00 -drive file=/storage/emulated/0/VM/ws20169834/OVMF.fd,format=raw,readonly=on,if=pflash -drive file=/storage/emulated/0/VM/ws20169834/RELEASEX64_OVMF_VARS.fd,format=raw,if=pflash -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -device intel-iommu -monitor stdio -vnc :2'
osname="Windows_Server_2016_build_9834"
export setname
export diskfilename
export setfileurl
export setfileurl2
export setfileurl3
export setqemucommand
export osname