find_program(CLANG_FORMAT "clang-format")

if(CLANG_FORMAT)
    file(
        GLOB_RECURSE ALL_SOURCE_FILES
        CONFIGURE_DEPENDS
        ${PROJECT_SOURCE_DIR}/src/*.[ch]pp
        ${PROJECT_SOURCE_DIR}/src/*.[ch]
        ${PROJECT_SOURCE_DIR}/src/*.[ch]xx
        ${PROJECT_SOURCE_DIR}/ctest/*.[h]pp
        ${PROJECT_SOURCE_DIR}/ctest/*.[h]
        ${PROJECT_SOURCE_DIR}/ctest/*.[h]xx
    )

    add_custom_target(
        clang_format
        COMMAND ${CLANG_FORMAT} -i ${ALL_SOURCE_FILES}
        COMMENT
            "Clang-Format focuses on formatting source code to a specific style, while Clang-Tidy analyzes the code for potential issues, including bugs and performance issues."
    )
else()
    message(
        WARNING
        "clang-format not found - format target disabled\n"
        "Installation commands:\n"
        "\n"
        "  Fedora:    sudo dnf install clang-tools-extra\n"
        "  macOS:     brew install llvm\n"
        "  Windows:   choco install llvm\n"
        "  Ubuntu:    sudo apt install clang-format\n"
        "\n"
        "Regenerate project after installation\n"
        "Note: Ensure clang-format is in your PATH"
    )
endif()
