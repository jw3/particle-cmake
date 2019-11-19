from conans import ConanFile, tools
import os

repo_url = 'https://github.com/rickkas7/JsonParserGeneratorRK.git'
commit_sha = '4ee11b425c0dff66f08db0551c6a4dac3af6f767'
build_dir = os.getenv("BUILD_DIR", "build")
source_dir = os.getenv("PKG_SRC_DIR", None)


def lookup(name, default=None):
    v = default
    if os.path.exists(build_dir + "/" + name):
        v = tools.load(build_dir + "/" + name)
    return os.getenv("CONAN_" + name, v)


class ParticlePackage(ConanFile):
    name = "JsonRK"
    version = lookup("VERSION", "snapshot")
    settings = "os", "compiler", "build_type", "arch"
    url = "https://github.com/jw3/conan-particle"
    exports = build_dir + "/VERSION"
    generators = "cmake"
    requires = []

    def package(self):
        self.copy("*.cmake", src=f"{source_dir}/cmake")
        self.copy("*.c*", dst="src", src='src')
        self.copy("*.h*", dst="include", src='src')

    def source(self):
        self.run(f"git clone {repo_url} .")
        if commit_sha:
            self.run(f"git checkout {commit_sha}")
