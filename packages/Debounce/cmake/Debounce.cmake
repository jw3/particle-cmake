set(Debounce ${CONAN_DEBOUNCE_ROOT})

file(GLOB SOURCE_FILES ${Debounce}/src/*)

add_library(Debounce STATIC ${SOURCE_FILES})
target_include_directories(Debounce PRIVATE ${Debounce}/include ${PLATFORM_CXX_INCLUDES})
target_compile_options(Debounce PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
target_compile_definitions(Debounce PRIVATE ${PLATFORM_CXX_DEFS})
