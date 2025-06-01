cmake_minimum_required(VERSION 3.28)

add_executable(print_environment print_environment.cxx)
set_target_properties(print_environment PROPERTIES CXX_STANDARD 23)
add_test(NAME print_environment COMMAND $<TARGET_FILE:print_environment>)
target_link_libraries(print_environment PRIVATE warnings)

add_executable(doctest_example doctest_example.cxx)
target_link_libraries(doctest_example PRIVATE doctest)
set_target_properties(doctest_example PROPERTIES CXX_STANDARD 23)
add_test(NAME doctest_example COMMAND $<TARGET_FILE:doctest_example>)
