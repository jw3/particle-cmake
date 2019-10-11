set(AssetTrackerRK ${CONAN_ASSETTRACKERRK_ROOT})
include(LIS3DH)

file(GLOB SOURCE_FILES ${AssetTrackerRK}/src/*)

add_library(AssetTrackerRK STATIC ${SOURCE_FILES})
target_include_directories(AssetTrackerRK PRIVATE ${AssetTrackerRK}/include ${LIS3DH}/include ${PLATFORM_CXX_INCLUDES})
target_compile_options(AssetTrackerRK PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
target_compile_definitions(AssetTrackerRK PRIVATE ${PLATFORM_CXX_DEFS})
add_dependencies(AssetTrackerRK LIS3DH)
