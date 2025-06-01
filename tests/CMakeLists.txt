cmake_minimum_required(VERSION 3.28)

add_executable(env_test env_test.cxx)
set_target_properties(env_test PROPERTIES CXX_STANDARD 26)
add_test(NAME env_test COMMAND $<TARGET_FILE:env_test>)
target_link_libraries(env_test PRIVATE warnings)

add_executable(doctest_example doctest_example.cxx)
target_link_libraries(doctest_example PRIVATE doctest warnings)
set_target_properties(doctest_example PROPERTIES CXX_STANDARD 26)
add_test(NAME doctest_example COMMAND $<TARGET_FILE:doctest_example>)

add_executable(imgui_example imgui_example.cxx)
target_link_libraries(
    imgui_example
    PRIVATE doctest SDL3::SDL3 imgui_sdl3_opengl3 warnings
)
set_target_properties(imgui_example PROPERTIES CXX_STANDARD 26)
add_test(NAME imgui_example COMMAND $<TARGET_FILE:imgui_example>)