if (NOT PLATFORM)
    message(WARNING "defaulting to photon platform, specify with PLATFORM")
    set(PLATFORM photon)
elseif (NOT PLATFORM MATCHES "^photon$|^electron$|^argon$|^xenon$|^boron$")
    message(FATAL_ERROR "invalid platform [${PLATFORM}] (choose 'photon' | 'electron' | 'argon' | 'xenon' | 'boron')")
endif ()

set(BUILD_DIR ${CMAKE_BINARY_DIR})
set(GCC_ARM_PATH /usr/local/gcc-arm/bin/)
set(GCC_PREFIX arm-none-eabi-)
set(FIRMWARE_DIR /usr/local/src/particle/firmware)

include(${PLATFORM})
include(particle)
