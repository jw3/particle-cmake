if (NOT PLATFORM)
    message(WARNING "defaulting to photon platform, specify with PLATFORM")
    set(PLATFORM photon)
elseif (NOT PLATFORM MATCHES "^photon$|^electron$")
    message(FATAL_ERROR "invalid platform [${PLATFORM}] (choose 'photon' or 'electron')")
endif ()

if (NOT FIRMWARE_VERSION)
    message(FATAL_ERROR "Firmware version was not specified with FIRMWARE_VERSION")
endif ()

set(BUILD_DIR ${CMAKE_BINARY_DIR})
set(GCC_ARM_PATH /usr/local/gcc-arm/bin/)
set(FIRMWARE_DIR /usr/local/src/particle/firmware)

message("including ${CMAKE_CURRENT_SOURCE_DIR} cmake dir")
include(${PLATFORM} NO_POLICY_SCOPE)
include(particle NO_POLICY_SCOPE)
