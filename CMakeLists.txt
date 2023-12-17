cmake_minimum_required(VERSION 3.25)

project(Template-Cpp-Project VERSION 1.0.0 LANGUAGES CXX C)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

include(cmake/code_quality.cmake)

add_subdirectory(src)

option(BUILD_TESTS "Build tests" ON)

if (BUILD_TESTS)
    enable_testing()
    add_subdirectory(test)
endif ()