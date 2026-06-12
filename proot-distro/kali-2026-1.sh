DISTRO_NAME="Kali (2026.1)"
DISTRO_COMMENT="Stable release."

TARBALL_URL['aarch64']="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-minimal-arm64.tar.xz"
TARBALL_SHA256['aarch64']="08f121b553d03476b82b6322365eb4f47f73f4edf8800dafa7462b061eb2d0fc"
TARBALL_URL['arm']="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-minimal-armhf.tar.xz"
TARBALL_SHA256['arm']="1ff5a8313cca728cf3c967bd2c8b59c629e8d4b9f4b35bf62b9df9f0097c8c1d"
TARBALL_URL['i686']="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-minimal-i386.tar.xz"
TARBALL_SHA256['i686']="1aa7d3ef4f8b6e079d5a2ec6a025deec601eab8c7236b336bb9ba23a67845994"
TARBALL_URL['x86_64']="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-minimal-amd64.tar.xz"
TARBALL_SHA256['x86_64']="63c7ce7c65430b3e95a0e7af530de9e2513dc90df1ced1336e192953c97b7dd6"

distro_setup() {
    run_proot_cmd echo Kali Linux has been installed.
}