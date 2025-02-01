find_program(CPPLINT "cpplint")

if(CPPLINT)
    file(
        GLOB_RECURSE
        ALL_SOURCE_FILES
        CONFIGURE_DEPENDS
        ${PROJECT_SOURCE_DIR}/src/*.[ch]pp
        ${PROJECT_SOURCE_DIR}/src/*.[ch]
        ${PROJECT_SOURCE_DIR}/src/*.[ch]xx
        ${PROJECT_SOURCE_DIR}/ctest/*.[h]pp
        ${PROJECT_SOURCE_DIR}/ctest/*.[h]
        ${PROJECT_SOURCE_DIR}/ctest/*.[h]xx)

    add_custom_target(
        cpplint
        COMMAND ${CPPLINT} --recursive ${ALL_SOURCE_FILES}
        COMMENT
            "Cpplint is a command-line tool to check C/C++ files for style issues according to Google's C++ style guide."
        )
else()
    message(
        WARNING "cpplint not found - lint target disabled\n"
                "Installation methods:\n"
                "\n"
                "  Fedora:    sudo dnf install cpplint\n"
                "  macOS:     brew install cpplint\n"
                "  Python:    pip install cpplint\n"
                "\n"
                "Note: Ensure cpplint is in your PATH after installation")
endif()