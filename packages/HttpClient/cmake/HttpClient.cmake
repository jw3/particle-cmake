set(HttpClient ${CONAN_HTTPCLIENT_ROOT})

file(GLOB SOURCE_FILES ${HttpClient}/src/*)

add_library(HttpClient STATIC ${SOURCE_FILES})
target_include_directories(HttpClient PRIVATE ${HttpClient}/include ${PLATFORM_CXX_INCLUDES})
target_compile_options(HttpClient PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
target_compile_definitions(HttpClient PRIVATE ${PLATFORM_CXX_DEFS})
