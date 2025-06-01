cmake_minimum_required(VERSION 3.28)

add_executable(main main.cxx)
target_link_libraries(main PRIVATE warnings)
set_target_properties(
    main
    PROPERTIES CXX_STANDARD 23 CXX_STANDARD_REQUIRED YES CXX_EXTENSIONS NO
)

cpack_add_component(
    runtime
    DISPLAY_NAME "Runtime"
    DESCRIPTION "template-cpp-project main (runtime component)"
    REQUIRED
)

install(
    TARGETS main
    RUNTIME DESTINATION bin/main
    ARCHIVE DESTINATION bin/main
    LIBRARY
        DESTINATION lib/main
        COMPONENT runtime
        PERMISSIONS
            OWNER_READ
            OWNER_WRITE
            OWNER_EXECUTE
            GROUP_READ
            GROUP_EXECUTE
            WORLD_READ
            WORLD_EXECUTE
)
