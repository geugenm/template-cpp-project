cmake_minimum_required(VERSION 3.25)

project(Template-Cpp-Project VERSION 1.0.0 LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 23)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

include(cmake/configure_compiler.cmake)
include(cmake/code_quality.cmake)

include(cmake/check_platform.cmake)

add_subdirectory(src)

option(BUILD_TESTS "Build tests" ON)

if (BUILD_TESTS)
    enable_testing()
    add_subdirectory(test)
endif ()