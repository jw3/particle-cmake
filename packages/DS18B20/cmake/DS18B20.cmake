set(DS18B20 ${CONAN_DS18B20_ROOT})
include(OneWire)

file(GLOB SOURCE_FILES ${DS18B20}/src/*)

add_library(DS18B20 STATIC ${SOURCE_FILES})
target_include_directories(DS18B20 PRIVATE ${DS18B20}/include ${OneWire}/include ${PLATFORM_CXX_INCLUDES})
target_compile_options(DS18B20 PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
target_compile_definitions(DS18B20 PRIVATE ${PLATFORM_CXX_DEFS})
add_dependencies(DS18B20 OneWire)
