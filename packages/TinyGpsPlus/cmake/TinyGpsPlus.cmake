set(TinyGpsPlus ${CONAN_TINYGPSPLUS_ROOT})

set(SOURCE_FILES ${TinyGpsPlus}/src/TinyGPS++.cpp)
if (NOT EXISTS ${SOURCE_FILES})
    file(WRITE ${SOURCE_FILES})
endif ()

add_library(TinyGpsPlus STATIC ${SOURCE_FILES})
target_include_directories(TinyGpsPlus PRIVATE ${TinyGpsPlus}/include ${PLATFORM_CXX_INCLUDES})
target_compile_options(TinyGpsPlus PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
target_compile_definitions(TinyGpsPlus PRIVATE ${PLATFORM_CXX_DEFS})
