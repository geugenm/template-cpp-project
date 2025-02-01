find_program(CLANG_FORMAT "clang-format")

if(CLANG_FORMAT)
    add_custom_target(
        clang_format
        COMMAND
            ${CLANG_FORMAT} -i ${PROJECT_SOURCE_DIR}/**/*.{cpp,cxx,c,hpp,hxx,h}
        COMMENT
            "Clang-Format focuses on formatting source code to a specific style, while Clang-Tidy analyzes the code for potential issues, including bugs and performance issues."
        )
else()
    message(
        WARNING "clang-format not found - format target disabled\n"
                "Installation commands:\n"
                "\n"
                "  Fedora:    sudo dnf install clang-tools-extra\n"
                "  macOS:     brew install llvm\n"
                "  Windows:   choco install llvm\n"
                "  Ubuntu:    sudo apt install clang-format\n"
                "\n"
                "Regenerate project after installation\n"
                "Note: Ensure clang-format is in your PATH")
endif()
