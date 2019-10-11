set(MQTT ${CONAN_MQTT_ROOT})

file(GLOB SOURCE_FILES ${MQTT}/src/*)

add_library(MQTT STATIC ${SOURCE_FILES})
target_include_directories(MQTT PRIVATE ${MQTT}/include ${PLATFORM_CXX_INCLUDES})
target_compile_options(MQTT PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
target_compile_definitions(MQTT PRIVATE ${PLATFORM_CXX_DEFS})
