set(OneWire ${CONAN_ONEWIRE_ROOT})

file(GLOB SOURCE_FILES ${CONAN_ONEWIRE_ROOT}/src/*)

add_library(OneWire STATIC ${SOURCE_FILES})
target_include_directories(OneWire PRIVATE ${OneWire}/include ${PLATFORM_CXX_INCLUDES})
target_compile_options(OneWire PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
target_compile_definitions(OneWire PRIVATE ${PLATFORM_CXX_DEFS})
