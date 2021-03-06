#!/usr/bin/env bash

readonly sourcedir="${SOURCE_DIR:-${PWD}}"
readonly builddir="${BUILD_DIR:-${sourcedir}/build}"

readonly conanpath="${CONAN_PATH:-${sourcedir}}"
readonly conanuser="${CONAN_USER:-jw3}"
readonly conanchannel="${CONAN_CHANNEL:-stable}"

readonly cross_compiler_root=${CROSS_COMPILER_ROOT:-/usr/local/gcc-arm}
readonly compiler_major_version=$("${cross_compiler_root}/bin/arm-none-eabi-gcc" -dumpspecs | grep *version -A1 | tail -n1 | cut -d. -f1)

_echoerr() { if [[ ${QUIET} -ne 1 ]]; then echo "[debug]: $@" 1>&2; fi }
_checkerr() { ec=${1}; if [[ ${ec} -ne 0 ]]; then _echoerr "$2 failed with error code $ec"; exit ${ec}; fi }
_checkec() { ec=${?}; _checkerr ${ec} "$1"; }

build() {
  IFS=' ' read -r -a ext_cmake_args <<< "$CMAKE_ARGS"

  if [[ "$2" != "quick" ]]; then
    rm -rf "$builddir"
    mkdir "$builddir"
  fi

  if [ ! -d ${builddir} ]; then mkdir -p "$builddir"; fi
  cd ${builddir}
  cmake ${ext_cmake_args[@]} ${sourcedir}
  _checkec "cmake"

  cd ${sourcedir}/packages

  # export the version generated by cmake
  export BUILD_DIR=${builddir}

  for pkg in *; do
    export PKG_SRC_DIR="${sourcedir}/packages/$pkg"
    conan source ${PKG_SRC_DIR} -sf ${builddir}/${pkg}
    conan export-pkg ${PKG_SRC_DIR} "$conanuser/$conanchannel" -s compiler.version="$compiler_major_version" -sf ${builddir}/${pkg} -f
  done
}


publish() {
  if [ ! -d ${builddir} ]; then mkdir -p "$builddir"; fi
  cd ${builddir}
  cmake ${sourcedir}

  version="${CONAN_VERSION:-$(cat ${builddir}/VERSION)}"
  remote="${CONAN_REMOTE:-particle-bintray}"

  _echoerr "conan upload $conanuser/$conanchannel"
  for pkg in packges/*; do
    conan upload "$pkg/$version@$conanuser/$conanchannel" -c -r "$remote" --all
  done
}


case "${1,,}" in
  ("publish") publish ;;
          (*) build "$@" ;;
esac
