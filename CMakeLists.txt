cmake_minimum_required(VERSION 3.26)

project(Template-Cpp-Project VERSION 1.0.0 LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 23)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

include(cmake/configure_compiler.cmake)
include(cmake/code_quality.cmake)

include(cmake/check_platform.cmake)
include(cmake/packages.cmake)

add_subdirectory(src)

add_subdirectory(test)