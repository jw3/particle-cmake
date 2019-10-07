from conans import ConanFile, tools
import os

build_dir = os.getenv("BUILD_DIR", "build")

def lookup(name, default = None):
    v = default
    if os.path.exists(build_dir + "/" + name):
        v = tools.load(build_dir + "/" + name)
    return os.getenv("CONAN_" + name, v)

class ParticlePackage(ConanFile):
    name = "DS18B20"
    version = lookup("VERSION", "snapshot")
    settings = "os", "compiler", "build_type", "arch"
    url = "https://github.com/jw3/particle-cmakes"
    exports = build_dir + "/VERSION"
    generators = "cmake"
    requires = "OneWire/" + version + "@jw3/stable"

    def package(self):
        self.copy("*.cmake", src="cmake")
        self.copy("*.patch", src="patch", dst="patch", keep_path=True)
