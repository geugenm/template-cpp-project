cmake_minimum_required(VERSION 3.26)

project(cxx_project
        VERSION 1.0.0
        DESCRIPTION "My awesome C/C++ project!"
        LANGUAGES C CXX)

list(APPEND CMAKE_PREFIX_PATH cmake/cfg)

find_package(clang_format CONFIG REQUIRED)
find_package(clang_tidy CONFIG REQUIRED)
find_package(cpplint CONFIG REQUIRED)
find_package(doxygen CONFIG REQUIRED)

option(USE_CPM "Use cpm (cmake package manager) - https://github.com/cpm-cmake/CPM.cmake" ON)
if (USE_CPM)
    include(cmake/CPM.cmake)
endif ()

add_subdirectory(src)

option(BUILD_TESTS "Build tests" ON)
if (BUILD_TESTS)
    include(CTest)
    add_subdirectory(ctest)
endif ()
