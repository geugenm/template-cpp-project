cmake_minimum_required(VERSION 3.28)

project(
    cxx_project
    VERSION 1.0.0
    DESCRIPTION "My awesome C/C++ project!"
    LANGUAGES C CXX
)

list(APPEND CMAKE_PREFIX_PATH cmake cmake/pkg cmake/utils)

find_package(warnings CONFIG REQUIRED)

find_package(clang_format CONFIG REQUIRED)
find_package(clang_tidy CONFIG REQUIRED)
find_package(clang_doc CONFIG REQUIRED)

find_package(cpplint CONFIG REQUIRED)
find_package(doxygen CONFIG REQUIRED)
find_package(package CONFIG REQUIRED)

find_package(cpm CONFIG REQUIRED)

add_subdirectory(src)

option(BUILD_TESTS "Enable building of test suite" ON)
if(BUILD_TESTS)
    include(CTest)
    add_subdirectory(tests)
endif()
