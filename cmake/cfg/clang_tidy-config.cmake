find_program(CLANG_TIDY "clang-tidy")

if(CLANG_TIDY)
    set(CMAKE_CXX_CLANG_TIDY ${CLANG_TIDY})
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