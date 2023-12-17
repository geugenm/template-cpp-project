cmake_minimum_required(VERSION 3.25.1)

project(Template-Cpp-Project VERSION 1.0.0 LANGUAGES CXX C)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

include(cmake/code_quality.cmake)

include(cmake/get_cpm.cmake)

add_subdirectory(src)

option(BUILD_TESTS "Build tests" ON)
option(USE_CPM "Use Cmake Package Manager" OFF)

if (BUILD_TESTS)
    enable_testing()
    add_subdirectory(test)
endif ()