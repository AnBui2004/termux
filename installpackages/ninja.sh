apt update
apt upgrade -y
apt install cmake clang build-essential libandroid-spawn binutils python pip -y
export LDFLAGS+=" -landroid-spawn"
pip install ninja