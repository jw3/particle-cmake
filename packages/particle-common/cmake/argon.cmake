# see common-tools.mk
# see arm-tools.mk
# see gcc-tools.mk

# todo;; set these with appropriate path rooted to user_remote
#-MD
#-MP
#-MF
#../build/target/user/platform-12-m/workspace/application.o.d

message("\n=============================== Configuring firmware for the -=-= ${PLATFORM} =-=- ===============================\n")

set(CMAKE_CXX_COMPILER "${GCC_ARM_PATH}/arm-none-eabi-g++")

set(PLATFORM_CXX_FLAGS
    -g3
    -gdwarf-2
    -Os
    -mcpu=cortex-m4
    -mthumb
    -mabi=aapcs
    -mfloat-abi=hard
    -mfpu=fpv4-sp-d16
    -ffunction-sections
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
    -fcheck-new
    -std=gnu++14
    -Wundef
    )

string(REPLACE ";" " " PLATFORM_CXX_FLAGS "${PLATFORM_CXX_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${PLATFORM_CXX_FLAGS}")

set(PLATFORM_CXX_DEFS
    STM32_DEVICE
    nRF52840
    NRF52840_XXAA
    PLATFORM_THREADING=1
    PLATFORM_ID=12
    PLATFORM_NAME=argon
    USBD_VID_SPARK=0x2B04
    USBD_PID_DFU=0xD00C
    USBD_PID_CDC=0xC00C
    SPARK_PLATFORM
    INCLUDE_PLATFORM=1
    SOFTDEVICE_PRESENT=1
    S140
    PRODUCT_ID=12
    OPENTHREAD_PROJECT_CORE_CONFIG_FILE="openthread-config-project.h"
    ENABLE_FEM=1
    NRF_802154_PROJECT_CONFIG="openthread-platform-config.h"
    RAAL_SOFTDEVICE=1
    _WIZCHIP_=W5500
    USE_STDPERIPH_DRIVER
    DFU_BUILD_ENABLE
    LFS_CONFIG=lfs_config.h
    RELEASE_BUILD
    SPARK=1
    PARTICLE=1
    START_DFU_FLASHER_SERIAL_SPEED=14400
    START_YMODEM_FLASHER_SERIAL_SPEED=28800
    SPARK_PLATFORM_NET=ESP32
    LOG_INCLUDE_SOURCE_INFO=1
    PARTICLE_USER_MODULE
    USER_FIRMWARE_IMAGE_SIZE=0x20000
    USER_FIRMWARE_IMAGE_LOCATION=0xD4000
    MODULAR_FIRMWARE=1
    MODULE_VERSION=6
    MODULE_FUNCTION=5
    MODULE_INDEX=1
    MODULE_DEPENDENCY=4,1,1404
    MODULE_DEPENDENCY2=0,0,0
    _WINSOCK_H
    _GNU_SOURCE
    LOG_MODULE_CATEGORY="app"
    )

set(PLATFORM_CXX_INCLUDES
    ${FIRMWARE_DIR}/user/inc
    ${FIRMWARE_DIR}/wiring/inc
    ${FIRMWARE_DIR}/system/inc
    ${FIRMWARE_DIR}/third_party/miniz/miniz
    ${FIRMWARE_DIR}/services/inc
    ${FIRMWARE_DIR}/third_party/nanopb/nanopb
    ${FIRMWARE_DIR}/communication/inc
    ${FIRMWARE_DIR}/hal/inc
    ${FIRMWARE_DIR}/hal/shared
    ${FIRMWARE_DIR}/hal/src/argon
    ${FIRMWARE_DIR}/hal/network/lwip/esp32
    ${FIRMWARE_DIR}/hal/src/nRF52840
    ${FIRMWARE_DIR}/hal/src/armv7
    ${FIRMWARE_DIR}/hal/src/nRF52840
    ${FIRMWARE_DIR}/hal/src/nRF52840/lwip
    ${FIRMWARE_DIR}/hal/src/nRF52840/freertos
    ${FIRMWARE_DIR}/hal/src/nRF52840/openthread
    ${FIRMWARE_DIR}/hal/src/nRF52840/mbedtls
    ${FIRMWARE_DIR}/hal/src/nRF52840/littlefs
    ${FIRMWARE_DIR}/hal/network/api
    ${FIRMWARE_DIR}/hal/network/lwip
    ${FIRMWARE_DIR}/hal/network/lwip/posix
    ${FIRMWARE_DIR}/hal/network/openthread
    ${FIRMWARE_DIR}/hal/network/lwip/wiznet
    ${FIRMWARE_DIR}/hal/network/ncp
    ${FIRMWARE_DIR}/hal/network/ncp/at_parser
    ${FIRMWARE_DIR}/third_party/lwip/lwip/src/include
    ${FIRMWARE_DIR}/third_party/freertos/freertos/FreeRTOS/Source/include
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/external/freertos/portable/GCC/nrf52
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/external/freertos/portable/CMSIS/nrf52
    ${FIRMWARE_DIR}/third_party/openthread/openthread/include
    ${FIRMWARE_DIR}/third_party/openthread/openthread/src/core
    ${FIRMWARE_DIR}/third_party/openthread/openthread/examples/platforms
    ${FIRMWARE_DIR}/third_party/openthread/openthread/third_party/NordicSemiconductor/drivers/radio
    ${FIRMWARE_DIR}/third_party/openthread/openthread/third_party/NordicSemiconductor/drivers/radio/hal
    ${FIRMWARE_DIR}/third_party/openthread/openthread/third_party/NordicSemiconductor/drivers/radio/rsch
    ${FIRMWARE_DIR}/third_party/openthread/openthread/third_party/NordicSemiconductor/drivers/radio/rsch/raal
    ${FIRMWARE_DIR}/third_party/openthread/openthread/third_party/NordicSemiconductor/drivers/radio/rsch/raal/softdevice
    ${FIRMWARE_DIR}/third_party/wiznet_driver/wiznet_driver/Ethernet
    ${FIRMWARE_DIR}/gsm0710muxer/gsm0710muxer/include
    ${FIRMWARE_DIR}/platform/shared/inc
    ${FIRMWARE_DIR}/third_party/nrf5_sdk
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/toolchain/cmsis/include
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/modules/nrfx
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/modules/nrfx/drivers
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/modules/nrfx/drivers/include
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/modules/nrfx/hal
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/modules/nrfx/mdk
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/modules/nrfx/hal
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/modules/nrfx/drivers/src/prs
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/util
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/softdevice/s140/headers
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/softdevice/s140/headers/nrf52
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/softdevice/common
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/fstorage
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/experimental_section_vars
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/atomic
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/crc32
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/integration/nrfx/legacy
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/delay
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/log
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/log
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/log/src
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/experimental_section_vars
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/atomic
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/delay
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/queue
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/softdevice/common
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/softdevice/mbr/nrf52840/headers
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/softdevice/s140
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/softdevice/s140/headers
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/softdevice/s140/headers/nrf52
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/fifo
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/atomic_fifo
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/strerror
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/fstorage
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/atomic_flags
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/usbd
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/usbd/class/cdc
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/libraries/usbd/class/cdc/acm
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/ble/common
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/ble/nrf_ble_gatt
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/ble/ble_advertising
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/nfc/t2t_lib
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/nfc/platform
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/nfc/ndef/generic/message
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/nfc/ndef/generic/record
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/nfc/ndef/lauchapp
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/nfc/ndef/text
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/components/nfc/ndef/uri
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/external/nrf_cc310/include
    ${FIRMWARE_DIR}/third_party/nrf5_sdk/nrf5_sdk/external/utf_converter
    ${FIRMWARE_DIR}/third_party/littlefs/littlefs
    ${FIRMWARE_DIR}/platform/MCU/nRF52840/inc
    ${FIRMWARE_DIR}/dynalib/inc
    )
