cmake_minimum_required(VERSION 3.28)

project(
    cxx_project
    VERSION 1.0.0
    DESCRIPTION "My awesome C/C++ project!"
    HOMEPAGE_URL "https://github.com/geugenm/template-cpp-project"
    LANGUAGES C CXX
)

list(
    APPEND
    CMAKE_PREFIX_PATH
    ${CMAKE_CURRENT_LIST_DIR}/cmake
    ${CMAKE_CURRENT_LIST_DIR}/cmake/pkg
    ${CMAKE_CURRENT_LIST_DIR}/cmake/utils
)

list(
    APPEND
    CMAKE_FIND_ROOT_PATH
    ${CMAKE_CURRENT_LIST_DIR}/cmake
    ${CMAKE_CURRENT_LIST_DIR}/cmake/pkg
    ${CMAKE_CURRENT_LIST_DIR}/cmake/utils
)

message(STATUS "CMAKE_PREFIX_PATH: ${CMAKE_PREFIX_PATH}")

find_package(warnings CONFIG REQUIRED)

find_package(package CONFIG REQUIRED)

find_package(clang_format CONFIG REQUIRED)
find_package(clang_tidy CONFIG REQUIRED)
find_package(clang_doc CONFIG REQUIRED)
find_package(cpplint CONFIG REQUIRED)
find_package(doxygen CONFIG REQUIRED)

find_package(cpm CONFIG REQUIRED)

add_subdirectory(src)

option(BUILD_TESTS "Enable building of test suite" ON)
if(BUILD_TESTS)
    include(CTest)
    add_subdirectory(tests)
endif()