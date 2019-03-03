add_library(app STATIC application.cpp)
target_include_directories(app PRIVATE ${CONAN_INCLUDE_DIRS})
target_link_libraries(app PRIVATE CONAN_PKG::particle)
target_compile_definitions(app PRIVATE ${PLATFORM_CXX_DEFS})
