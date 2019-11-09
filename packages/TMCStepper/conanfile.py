from conans import ConanFile, tools
import os

repo_url = 'https://github.com/teemuatlut/TMCStepper.git'
commit_sha = 'v0.5.2'
build_dir = os.getenv("BUILD_DIR", "build")
source_dir = os.getenv("PKG_SRC_DIR", None)


def lookup(name, default=None):
    v = default
    if os.path.exists(build_dir + "/" + name):
        v = tools.load(build_dir + "/" + name)
    return os.getenv("CONAN_" + name, v)


class ParticlePackage(ConanFile):
    name = "TMCStepper"
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
        tools.patch(patch_file=f"{source_dir}/patch/0001-implement-transfer16.patch")
        tools.patch(patch_file=f"{source_dir}/patch/0001-undefine-conflicts.patch")
