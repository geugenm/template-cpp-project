cmake_minimum_required(VERSION 3.26)

add_executable(main main.cxx)
target_link_libraries(main PRIVATE warnings)
set_target_properties(main PROPERTIES CXX_STANDARD 26)