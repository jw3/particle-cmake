set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static -specs=nano.specs -specs=nosys.specs -nostartfiles -L${CONAN_PARTICLE_ROOT}/modules/photon/system-part1 -L${CONAN_PARTICLE_ROOT}/modules/photon/system-part2 -L${CONAN_PARTICLE_ROOT}/modules/photon/user-part -L${CONAN_PARTICLE_ROOT}/linker -L${CONAN_PARTICLE_ROOT}/linker/stm32f2xx -L${CONAN_PARTICLE_ROOT}/hal/src/photon/lib")

add_executable(app application.cpp)
target_include_directories(app PRIVATE ${CONAN_INCLUDE_DIRS})

target_compile_definitions(app PRIVATE ${PLATFORM_CXX_DEFS})
target_compile_options(app PRIVATE "$<$<CONFIG:ALL>:${PLATFORM_CXX_FLAGS}>")
set_target_properties(app PROPERTIES
                      OUTPUT_NAME app.elf
                      LINK_DEPENDS ${CONAN_PARTICLE_ROOT}/modules/photon/user-part/linker.ld)


#find_library(PARTICLE_LIBRARY NAMES ${CONAN_LIBS_PARTICLE} PATHS ${CONAN_LIB_DIRS_PARTICLE})
#message(" ============== ${CONAN_LIB_DIRS_PARTICLE} === ${CONAN_LIBS_PARTICLE} === ${PARTICLE_LIBRARY}")
#target_link_libraries(app PRIVATE -static -Wl,--whole-archive user hal-dynalib services-dynalib system-dynalib rt-dynalib wiring communication-dynalib platform wiring_globals -Wl,--no-whole-archive nosys --specs=nano.specs)


set(libsss hal-dynalib services-dynalib system-dynalib rt-dynalib wiring communication-dynalib platform wiring_globals)

set(libs -Wl,--whole-archive ${CONAN_PARTICLE_ROOT}/hal/src/photon/lib/STM32F2xx_Peripheral_Libraries.a -Wl,--no-whole-archive)
foreach (l IN LISTS libsss)
    set(libs ${CONAN_LIB_DIRS_PARTICLE}/lib${l}.a ${libs})
endforeach ()

set(libs -Wl,--whole-archive ${libs} -Wl,--no-whole-archive)

message("============== ${libs} =================")
target_link_libraries(app PRIVATE ${libs} -lnosys)
