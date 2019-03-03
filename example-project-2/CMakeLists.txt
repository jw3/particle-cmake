cmake_minimum_required(VERSION 3.2)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
project(MyParticleProject)
set(CMAKE_CXX_STANDARD 14)

if (NOT EXISTS ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    message(FATAL_ERROR "The file conanbuildinfo.cmake doesn't exist, you have to run conan install first")
endif ()

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(TARGETS)

set(CMAKE_NO_SYSTEM_FROM_IMPORTED ON)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})
set(GCC_ARM_PATH /usr/local/gcc-arm/bin)

message("================${CMAKE_MODULE_PATH}====================")

include(photon)
add_subdirectory(app)
