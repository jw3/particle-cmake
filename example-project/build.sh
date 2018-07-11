#!/usr/bin/env bash

readonly fwversion="$FIRMWARE_VERSION"

if [ -z "$1" ]; then echo "usage: build.sh <platform>"; exit 1; fi

readonly platform="$1"
readonly builddir="build-$platform"

if [[ "$2" != "quick" ]]; then
  rm -rf "$builddir"
  mkdir "$builddir"
fi

if [ ! -d "$builddir" ]; then mkdir "$builddir"; fi

conan install . -if="$builddir"
cd "$builddir"
cmake .. -DPLATFORM="$platform" -DFIRMWARE_VERSION="$fwversion"
make -j1
