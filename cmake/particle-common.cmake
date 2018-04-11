set(BUILD_DIR ${CMAKE_BINARY_DIR})
set(GCC_ARM_PATH /usr/local/gcc-arm/bin/)
set(FIRMWARE_DIR /usr/local/src/particle/firmware)

if (NOT PLATFORM)
    message(WARNING "defaulting to photon platform, specify with PLATFORM")
    set(PLATFORM photon)
elseif (NOT PLATFORM MATCHES "^photon$|^electron$")
    message(FATAL_ERROR "invalid platform [${PLATFORM}] (choose 'photon' or 'electron')")
endif ()

message("
=============================== Configuring firmware for the -=-= ${PLATFORM} =-=- ===============================
")
include(${PLATFORM})

configure_file(common/flash.in ${CMAKE_BINARY_DIR}/flash)
