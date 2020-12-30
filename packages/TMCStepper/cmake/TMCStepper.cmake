set(TMCStepper ${CONAN_TMCSTEPPER_ROOT})
file(GLOB SOURCE_FILES ${CONAN_TMCSTEPPER_ROOT}/src/* ${CONAN_TMCSTEPPER_ROOT}/src/source/*)

add_library(TMCStepper STATIC ${SOURCE_FILES})
target_include_directories(TMCStepper PRIVATE ${TMCStepper}/include ${TMCStepper}/include/source ${PLATFORM_CXX_INCLUDES})
target_compile_options(TMCStepper PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
target_compile_definitions(TMCStepper PRIVATE ${PLATFORM_CXX_DEFS})
