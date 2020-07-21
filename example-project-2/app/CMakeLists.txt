set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/../packages/common/cmake)
include(photon)

add_executable(app application.cpp)
target_include_directories(app PRIVATE ${CONAN_INCLUDE_DIRS})

target_compile_definitions(app PRIVATE ${PLATFORM_CXX_DEFS})
target_compile_options(app PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
set_target_properties(app PROPERTIES OUTPUT_NAME app.elf)

set(libsss hal-dynalib services-dynalib system-dynalib rt-dynalib wiring communication-dynalib platform wiring_globals)

set(libs -Wl,--whole-archive ${CONAN_PARTICLE_ROOT}/hal/src/photon/lib/STM32F2xx_Peripheral_Libraries.a -Wl,--no-whole-archive)
foreach (l IN LISTS libsss)
    set(libs ${CONAN_LIB_DIRS_PARTICLE}/lib${l}.a ${libs})
endforeach ()

set(libs -Wl,--whole-archive ${libs} -Wl,--no-whole-archive)

target_compile_options(app PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
target_compile_definitions(app PRIVATE ${PLATFORM_CXX_DEFS})


message("============== ${libs} =================")
file(GLOB OZE ${CONAN_PARTICLE_ROOT}/modules/*.o)
target_link_libraries(app PRIVATE ${libs} ${OZE})
target_link_options(app PRIVATE ${PLATFORM_CXX_LINK_OPTIONS})


