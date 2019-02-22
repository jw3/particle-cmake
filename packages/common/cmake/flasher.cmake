configure_file(${CONAN_CMAKE_MODULE_PATH}/bin/flash.in ${CMAKE_BINARY_DIR}/flash)
configure_file(${CONAN_CMAKE_MODULE_PATH}/share/flash.mk.in ${CMAKE_BINARY_DIR}/${name}/flash.mk)
