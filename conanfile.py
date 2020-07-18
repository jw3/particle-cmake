from conans import ConanFile, CMake
import os

build_dir = os.getenv("BUILD_DIR", os.getcwd())


def fw_src(relpath):
    return os.path.join(build_dir, "firmware", relpath)


class ParticleFirmware(ConanFile):
    name = "particle"
    version = "2.0.0"
    license = "Apache 2.0"
    url = "https://github.com/jw3/particle-conan"
    description = "Conan packages from the Particle firmware"
    settings = "os", "compiler", "build_type", "arch"
    options = {"shared": [True, False]}
    default_options = {"shared": False}
    generators = "cmake"
    platform_name = "photon"
    platform = "platform-6-m"
    app_dir = os.path.join(os.getcwd(), "build-2/firmware/user/applications/tinker")

    def source(self):
        self.run(f"git clone --single-branch -b v{self.version} file:///usr/local/src/particle/firmware")

    def build(self):
        self.run(f'cd firmware/main && APPDIR={self.app_dir} make PLATFORM={self.platform_name}')

    def package(self):
        print(os.getcwd())
        print(self.platform)
        # headers;; hope to autogen someday
        self.copy("*.h", dst="include", src=fw_src("user/inc"))
        self.copy("*.h", dst="include", src=fw_src("wiring/inc"))
        self.copy("*.h", dst="include", src=fw_src("system/inc"))
        self.copy("*.h", dst="include", src=fw_src("services/inc"))
        self.copy("*.h", dst="include", src=fw_src("communication/inc"))
        self.copy("*.h", dst="include", src=fw_src("hal/inc"))
        self.copy("*.h", dst="include", src=fw_src("hal/shared"))
        self.copy("*.h", dst="include", src=fw_src("hal/src/photon"))
        self.copy("*.h", dst="include", src=fw_src("hal/src/stm32f2xx"))
        self.copy("*.h", dst="include", src=fw_src("hal/src/stm32"))
        self.copy("*.h", dst="include", src=fw_src("hal/src/photon/api"))
        self.copy("*.h", dst="include", src=fw_src("hal/src/photon/include"))
        self.copy("*.h", dst="include", src=fw_src("platform/shared/inc"))
        self.copy("*.h", dst="include", src=fw_src("hal/src/photon/wiced/security/BESL/host/WICED/"))
        self.copy("*.h", dst="include", src=fw_src("hal/src/photon/wiced/security/BESL/include"))
        self.copy("*.h", dst="include", src=fw_src("hal/src/photon/wiced/security/BESL"))
        self.copy("*.h", dst="include", src=fw_src("hal/src/photon/wiced/security/BESL/crypto"))
        self.copy("*.h", dst="include", src=fw_src("hal/src/photon/wiced/WWD/include/"))
        self.copy("*.h", dst="include", src=fw_src("hal/src/photon/wiced/platform/include/"))
        self.copy("*.h", dst="include", src=fw_src("hal/src/photon/wiced/platform/GCC/"))
        self.copy("*.h", dst="include", src=fw_src("hal/src/photon/wiced/security/BESL/supplicant/"))
        self.copy("*.h", dst="include", src=fw_src("hal/src/photon/libraries/crypto"))
        self.copy("*.h", dst="include", src=fw_src("modules/photon/system-part1/inc"))
        self.copy("*.h", dst="include", src=fw_src("modules/shared/stm32f2xx/inc"))
        self.copy("*.h", dst="include", src=fw_src("platform/MCU/STM32F2xx/STM32_USB_Host_Driver/inc"))
        self.copy("*.h", dst="include", src=fw_src("platform/MCU/STM32F2xx/STM32_StdPeriph_Driver/inc"))
        self.copy("*.h", dst="include", src=fw_src("platform/MCU/STM32F2xx/STM32_USB_OTG_Driver/inc"))
        self.copy("*.h", dst="include", src=fw_src("platform/MCU/STM32F2xx/STM32_USB_Device_Driver/inc"))
        self.copy("*.h", dst="include", src=fw_src("platform/MCU/STM32F2xx/SPARK_Firmware_Driver/inc"))
        self.copy("*.h", dst="include", src=fw_src("platform/MCU/shared/STM32/inc"))
        self.copy("*.h", dst="include", src=fw_src("platform/MCU/STM32F2xx/CMSIS/Include"))
        self.copy("*.h", dst="include", src=fw_src("platform/MCU/STM32F2xx/CMSIS/Device/ST/Include"))
        self.copy("*.h", dst="include", src=fw_src("dynalib/inc"))
        self.copy("*.h", dst="include", src=fw_src("rt-dynalib/inc"))

        # firmware static libs
        self.copy("*.a", dst="lib", keep_path=False, src=fw_src(f'build/target/services-dynalib/{self.platform}'))
        self.copy("*.a", dst="lib", keep_path=False, src=fw_src(f"build/target/hal-dynalib/{self.platform}"))
        self.copy("*.a", dst="lib", keep_path=False, src=fw_src(f"build/target/system-dynalib/{self.platform}"))
        self.copy("*.a", dst="lib", keep_path=False, src=fw_src(f"build/target/rt-dynalib/{self.platform}"))
        self.copy("*.a", dst="lib", keep_path=False, src=fw_src(f"build/target/wiring/{self.platform}"))
        self.copy("*.a", dst="lib", keep_path=False, src=fw_src(f"build/target/wiring_globals/{self.platform}"))
        self.copy("*.a", dst="lib", keep_path=False, src=fw_src(f"build/target/communication-dynalib/{self.platform}"))
        self.copy("*.a", dst="lib", keep_path=False, src=fw_src(f"build/target/platform/{self.platform}"))

        # hal libs
        self.copy("*.a", dst=f"hal/src/{self.platform_name}/lib", keep_path=True, src=fw_src(f"hal/src/{self.platform_name}/lib"))

        # ld scripts
        self.copy("*.ld", dst="linker", src=fw_src("build/arm/linker"))
        self.copy("*.ld", dst="modules/shared", src=fw_src("modules/shared"))
        self.copy("*.ld", dst=f"modules/{self.platform_name}", src=fw_src(f"modules/{self.platform_name}"))

    # cmake
        self.copy(f"{self.platform_name}.cmake", dst='', keep_path=False, src='packages/common/cmake')

    def package_info(self):
        self.cpp_info.libs = self.collect_libs()
