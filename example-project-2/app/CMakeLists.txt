set(PLATFORM_CXX_FLAGS
    -std=gnu++11
    -g3
    -gdwarf-2
    -Os
    -mcpu=cortex-m3
    -mthumb
    -fdata-sections
    -Wall
    -Wno-switch
    -Wno-error=deprecated-declarations
    -fmessage-length=0
    -fno-strict-aliasing
    -fno-builtin-malloc
    -fno-builtin-free
    -fno-builtin-realloc
    -fno-exceptions
    -fno-rtti
    -fcheck-new)

set(PLATFORM_CXX_DEFS
    STM32_DEVICE
    STM32F2XX
    PLATFORM_THREADING=1
    PLATFORM_ID=6
    PLATFORM_NAME=photon
    USBD_VID_SPARK=0x2B04
    USBD_PID_DFU=0xD006
    USBD_PID_CDC=0xC006
    SPARK_PLATFORM
    INCLUDE_PLATFORM=1
    PRODUCT_ID=6
    PRODUCT_FIRMWARE_VERSION=65535
    USE_STDPERIPH_DRIVER
    DFU_BUILD_ENABLE
    RELEASE_BUILD
    SPARK=1
    PARTICLE=1
    START_DFU_FLASHER_SERIAL_SPEED=14400
    START_YMODEM_FLASHER_SERIAL_SPEED=28800
    SPARK_PLATFORM_NET=BCM9WCDUSI09
    LOG_INCLUDE_SOURCE_INFO=1
    PARTICLE_USER_MODULE
    USE_THREADING=0
    USE_SPI=SPI
    USE_CS=A2
    USE_SPI=SPI
    USE_CS=A2
    USE_THREADING=0
    USER_FIRMWARE_IMAGE_SIZE=0x20000
    USER_FIRMWARE_IMAGE_LOCATION=0x80A0000
    MODULAR_FIRMWARE=1
    MODULE_VERSION=4
    MODULE_FUNCTION=5
    MODULE_INDEX=1
    MODULE_DEPENDENCY=4,2,110
    _WINSOCK_H
    _GNU_SOURCE
    LOG_MODULE_CATEGORY="app")

set(PLATFORM_CXX_LINK_OPTIONS
    -specs=nano.specs
    -specs=nosys.specs
    -nostartfiles
    -L${CONAN_PARTICLE_ROOT}/modules/photon/system-part1
    -L${CONAN_PARTICLE_ROOT}/modules/photon/system-part2
    -L${CONAN_PARTICLE_ROOT}/modules/photon/user-part
    -L${CONAN_PARTICLE_ROOT}/linker
    -L${CONAN_PARTICLE_ROOT}/linker/stm32f2xx
    -L${CONAN_PARTICLE_ROOT}/hal/src/photon/lib
    -Wl,--defsym,USER_FIRMWARE_IMAGE_LOCATION=0x80A0000
    -Wl,--defsym,USER_FIRMWARE_IMAGE_SIZE=0x20000
    -Xlinker --gc-sections
    -T${CONAN_PARTICLE_ROOT}/modules/photon/user-part/linker.ld)

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
#set_target_properties(app PROPERTIES LINK_DEPENDS ${CONAN_PARTICLE_ROOT}/modules/photon/user-part/linker.ld)


