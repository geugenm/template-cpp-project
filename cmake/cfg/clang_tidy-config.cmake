find_program(CLANG_TIDY "clang-tidy")

if(CLANG_TIDY)
    add_custom_target(
        clang_tidy
        COMMAND
            ${CLANG_TIDY} ${PROJECT_SOURCE_DIR}/**/*.{cpp,cxx,hpp,hxx} --
            -std=c++${CMAKE_CXX_STANDARD}
        COMMENT
            "clang-tidy is a clang-based C++ “linter” tool. Its purpose is to provide an extensible framework for diagnosing and fixing typical programming errors, like style violations, interface misuse, or bugs that can be deduced via static analysis. clang-tidy is modular and provides a convenient interface for writing new checks."
        )
else()
    message(
        WARNING "clang-tidy not found - tidy target disabled\n"
                "Installation commands:\n"
                "\n"
                "  Fedora:    sudo dnf install clang-tools-extra\n"
                "  macOS:     brew install llvm\n"
                "  Windows:   choco install llvm\n"
                "  Ubuntu:    sudo apt install clang-tidy\n"
                "\n"
                "Regenerate project after installation\n"
                "Note: Ensure clang-tidy is in your PATH")
endif()
