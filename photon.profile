standalone_toolchain=/usr/local/gcc-arm
target_host=arm-none-eabi
cc_compiler=gcc
cxx_compiler=g++

[env]
CONAN_CMAKE_FIND_ROOT_PATH=$toolchain
PATH=[$standalone_toolchain/bin]
CHOST=$target_host
AR=$target_host-ar
AS=$target_host-as
RANLIB=$target_host-ranlib
CC=$target_host-$cc_compiler
CXX=$target_host-$cxx_compiler
STRIP=$target_host-strip
RC=$target_host-windres

[settings]
# We are building in Ubuntu Linux
os_build=Linux
arch_build=x86_64

# We are cross building to photon
os=Particle
os.board=photon
arch=stm32
compiler=gcc

compiler.version=5.3
compiler.libcxx=libstdc++11
build_type=Release
