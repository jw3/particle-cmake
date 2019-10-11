set(NeoGPS ${CONAN_NEOGPS_ROOT})
file(GLOB SOURCE_FILES ${CONAN_NEOGPS_ROOT}/src/* ${CONAN_NEOGPS_ROOT}/src/ublox/*)

add_library(NeoGPS STATIC ${SOURCE_FILES})
target_include_directories(NeoGPS PRIVATE ${NeoGPS}/include ${PLATFORM_CXX_INCLUDES})
target_compile_options(NeoGPS PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
target_compile_definitions(NeoGPS PRIVATE ${PLATFORM_CXX_DEFS})
