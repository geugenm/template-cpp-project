cmake_minimum_required(VERSION 3.25)

add_executable(env_test
    env_test.cxx
)

add_test(NAME env_test COMMAND $<TARGET_FILE:env_test>)
