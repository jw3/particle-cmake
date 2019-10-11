set(LiquidCrystalI2C ${CONAN_LIQUIDCRYSTALI2C_ROOT})

file(GLOB SOURCE_FILES ${AssetTrackerRK}/src/*)

add_library(LiquidCrystalI2C STATIC ${SOURCE_FILES})
target_include_directories(LiquidCrystalI2C PRIVATE ${LiquidCrystalI2C}/include ${PLATFORM_CXX_INCLUDES})
target_compile_options(LiquidCrystalI2C PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
target_compile_definitions(LiquidCrystalI2C PRIVATE ${PLATFORM_CXX_DEFS})
