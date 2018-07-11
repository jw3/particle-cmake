cmake_minimum_required(VERSION 3.0)
project(MyParticleProject)
set(CMAKE_CXX_STANDARD 14)

if (NOT EXISTS ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    message(FATAL_ERROR "The file conanbuildinfo.cmake doesn't exist, you have to run conan install first")
endif ()

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(NO_OUTPUT_DIRS)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})

find_package(Particle)

#include(MyDependency)
#add_particle_remote_app(my-srcdir MyDependency)
