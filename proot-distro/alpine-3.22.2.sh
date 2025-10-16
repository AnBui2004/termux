DISTRO_NAME="Alpine (3.22.2)"
DISTRO_COMMENT="Stable release."

TARBALL_URL['aarch64']="https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/aarch64/alpine-minirootfs-3.22.2-aarch64.tar.gz"
TARBALL_SHA256['aarch64']="6bf491907b705caa5fc65773fbbc1d0954530b6c455d4446f670a4c1fdcea489"
TARBALL_URL['arm']="https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/armhf/alpine-minirootfs-3.22.2-armhf.tar.gz"
TARBALL_SHA256['arm']="d3d11ad5bc8d006d10510887ee2a9f884afee7a2579280f13ef639bdfc159633"
TARBALL_URL['i686']="https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/x86/alpine-minirootfs-3.22.2-x86.tar.gz"
TARBALL_SHA256['i686']="5d7f5078a759c0c72651a68e0e236390b680b66343d526c9c75258dd5ded0964"
TARBALL_URL['x86_64']="https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/x86_64/alpine-minirootfs-3.22.2-x86_64.tar.gz"
TARBALL_SHA256['x86_64']="412454ed98025ad9cd910d13f3d448b184e81502baa83180e89f98d0f13674be"

distro_setup() {
    echo "nameserver 8.8.8.8" > ./etc/resolv.conf
    echo "nameserver 8.8.4.4" >> ./etc/resolv.conf
}
