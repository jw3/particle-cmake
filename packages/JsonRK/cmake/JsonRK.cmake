set(JsonRK ${CONAN_JSONRK_ROOT})

file(GLOB SOURCE_FILES ${JsonRK}/src/*)

add_library(JsonRK STATIC ${SOURCE_FILES})
target_include_directories(JsonRK PRIVATE ${JsonRK}/include ${PLATFORM_CXX_INCLUDES})
target_compile_options(JsonRK PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
target_compile_definitions(JsonRK PRIVATE ${PLATFORM_CXX_DEFS})
