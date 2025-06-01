cmake_minimum_required(VERSION 3.26)

project(
    cxx_project
    VERSION 1.0.0
    DESCRIPTION "My awesome C/C++ project!"
    LANGUAGES C CXX
)

list(APPEND CMAKE_PREFIX_PATH cmake cmake/pkg cmake/cpm cmake/cfg)

find_package(warnings CONFIG REQUIRED)

find_package(clang_format CONFIG REQUIRED)
find_package(clang_tidy CONFIG REQUIRED)
find_package(clang_doc CONFIG REQUIRED)
find_package(cpplint CONFIG REQUIRED)
find_package(doxygen CONFIG REQUIRED)
find_package(package CONFIG REQUIRED)

# Use cpm (cmake package manager) - https://github.com/cpm-cmake/CPM.cmake
include(cmake/CPM.cmake)

set(CPM_USE_LOCAL_PACKAGES ON)

find_package(doctest CONFIG REQUIRED)
find_package(freetype CONFIG REQUIRED)
find_package(imgui CONFIG REQUIRED)
find_package(sdl3 CONFIG REQUIRED)

add_subdirectory(src)

option(BUILD_TESTS "Build tests" ON)
if(BUILD_TESTS)
    include(CTest)
    add_subdirectory(tests)
endif()
