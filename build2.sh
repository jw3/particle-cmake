#!/usr/bin/env bash

# this is the experimental conan build using the root conanfile

readonly sourcedir="${SOURCE_DIR:-${PWD}}"
readonly builddir="${BUILD_DIR:-${sourcedir}/build-2}"
export BUILD_DIR=${builddir}

readonly conanpath="${CONAN_PATH:-${sourcedir}}"
readonly conanuser="${CONAN_USER:-jw3}"
readonly conanchannel="${CONAN_CHANNEL:-stable}"

_echoerr() { if [[ ${QUIET} -ne 1 ]]; then echo "[debug]: $@" 1>&2; fi }
_checkerr() { ec=${1}; if [[ ${ec} -ne 0 ]]; then _echoerr "$2 failed with error code $ec"; exit ${ec}; fi }
_checkec() { ec=${?}; _checkerr ${ec} "$1"; }

build() {
  if [[ ! -d ${builddir} ]]; then mkdir -p "$builddir"; fi
  cd ${builddir}

  conan install .. --profile ../photon.profile
  conan source ..
  conan build ..
  conan export-pkg .. "$conanuser/$conanchannel" -f
}


publish() {
  echo "noimpl"
}

_exportpkg() {
  local name="$1"
  conan export-pkg "$name" "$conanuser/$conanchannel" -f -s compiler.version=5.3
}


case "${1,,}" in
  ("publish") publish ;;
          (*) build "$@" ;;
esac
