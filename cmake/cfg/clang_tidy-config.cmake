find_program(CLANG_TIDY "clang-tidy")

if (CLANG_TIDY)
    add_custom_target(clang_tidy
            COMMAND ${CLANG_TIDY} ${PROJECT_SOURCE_DIR}/**/*.{cpp,cxx,hpp,hxx} -- -std=c++${CMAKE_CXX_STANDARD}
            COMMENT "clang-tidy is a clang-based C++ “linter” tool. Its purpose is to provide an extensible framework for diagnosing and fixing typical programming errors, like style violations, interface misuse, or bugs that can be deduced via static analysis. clang-tidy is modular and provides a convenient interface for writing new checks."
            )
else()
    message(WARNING "clang-tidy not found. The tidy target will not be available.\n"
        "To install clang-tidy, use one of the following commands:\n"
        "For DNF: sudo dnf install clang-tools-extra\n"
        "For Homebrew (macOS): brew install llvm\n"
        "For Chocolatey (Windows): choco install llvm\n"
        "For apt (Ubuntu): sudo apt install clang-tidy\n"
        "Please ensure that clang-tidy is in your PATH."
    )
endif()
