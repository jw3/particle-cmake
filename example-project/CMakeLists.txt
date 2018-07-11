cmake_minimum_required(VERSION 3.0)
project(particle_cmake_cross_compile)

set(CMAKE_CXX_STANDARD 11)

if(EXISTS ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    conan_basic_setup(NO_OUTPUT_DIRS)

    set(MEX_INSTALL_PREFIX ${CONAN_LIB_DIRS_ARA-MEX} ${CONAN_LIB_DIRS_PSU-MEX})
else()
    message(WARNING "The file conanbuildinfo.cmake doesn't exist, you have to run conan install first")
endif()

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})
set(CMAKE_VERBOSE_MAKEFILE OFF)

set(BUILD_DIR ${CMAKE_BINARY_DIR})
set(GCC_ARM_PATH /usr/local/gcc-arm/bin/)
set(FIRMWARE_DIR /usr/local/src/particle/firmware)

if (NOT FIRMWARE_VERSION)
    message(FATAL_ERROR "Firmware version was not specified with FIRMWARE_VERSION")
endif ()

if (NOT PLATFORM)
    message(WARNING "defaulting to photon platform, specify with PLATFORM")
    set(PLATFORM photon)
elseif (NOT PLATFORM MATCHES "^photon$|^electron$")
    message(FATAL_ERROR "invalid platform [${PLATFORM}] (choose 'photon' or 'electron')")
endif ()

include(${PLATFORM})
include(particle)
#include(flasher)

#include(TinyGpsPlus)
