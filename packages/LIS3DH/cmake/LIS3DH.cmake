set(LIS3DH ${CONAN_LIS3DH_ROOT})

file(GLOB SOURCE_FILES ${LIS3DH}/src/*)

add_library(LIS3DH STATIC ${SOURCE_FILES})
target_include_directories(LIS3DH PRIVATE ${LIS3DH}/include ${PLATFORM_CXX_INCLUDES})
target_compile_options(LIS3DH PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
target_compile_definitions(LIS3DH PRIVATE ${PLATFORM_CXX_DEFS})
