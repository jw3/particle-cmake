configure_file(${CONAN_PARTICLE-COMMON_ROOT}/bin/flash.in ${CMAKE_BINARY_DIR}/flash)
configure_file(${CONAN_PARTICLE-COMMON_ROOT}/share/flash.mk.in ${CMAKE_BINARY_DIR}/${name}/flash.mk)
