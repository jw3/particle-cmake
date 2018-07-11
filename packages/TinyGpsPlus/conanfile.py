from conans import ConanFile, tools
import os

build_dir = os.getenv("BUILD_DIR", "build")

def lookup(name, default = None):
    v = default
    if os.path.exists(build_dir + "/" + name):
        v = tools.load(build_dir + "/" + name)
    return os.getenv("CONAN_" + name, v)

class ParticlePackage(ConanFile):
    name = "TinyGpsPlus"
    version = lookup("VERSION", "snapshot")
    settings = "os", "compiler", "build_type", "arch"
    url = "https://github.com/jw3/particle-cmakes"
    exports = build_dir + "/VERSION"
    generators = "cmake"
    requires = []

    def package(self):
        self.copy("*.cmake", src="cmake")
