cmake_minimum_required(VERSION 3.26)

set(CMAKE_CXX_STANDARD 23)

add_subdirectory(lib)

add_executable(main main.cxx)