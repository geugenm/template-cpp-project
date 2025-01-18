cmake_minimum_required(VERSION 3.25)

add_executable(env_test env_test.cxx)
add_test(NAME env_test COMMAND $<TARGET_FILE:env_test>)

add_executable(doctest_example doctest_example.cxx)
target_link_libraries(doctest_example PRIVATE doctest)
add_test(NAME doctest_example COMMAND $<TARGET_FILE:doctest_example>)
