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
        WARNING
            "clang-format not found. The format target will not be available.\n"
            "To install clang-format, use one of the following commands:\n"
            "For DNF: sudo dnf install clang-tools-extra\n"
            "For Homebrew (macOS): brew install llvm\n"
            "For Chocolatey (Windows): choco install llvm\n"
            "For apt (Ubuntu): sudo apt install clang-format\n"
            "Please ensure that clang-format is in your PATH.")
endif()