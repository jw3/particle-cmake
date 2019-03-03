#!/usr/bin/env bash

readonly builddir="build-$platform"

if [[ "$2" != "quick" ]]; then
  rm -rf "$builddir"
  mkdir "$builddir"
fi

if [[ ! -d "$builddir" ]]; then mkdir "$builddir"; fi

conan install . -if="$builddir" -s compiler.version=5.3 -s arch=stm32 -s os=Particle -s os.board=photon -s compiler.libcxx=libstdc++11
cd "$builddir"
cmake .. -DCMAKE_C_COMPILER=/usr/local/gcc-arm/bin/arm-none-eabi-gcc -DCMAKE_CXX_COMPILER=/usr/local/gcc-arm/bin/arm-none-eabi-g++
make -j1
