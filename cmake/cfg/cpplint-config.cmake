find_program(CPPLINT "cpplint")

if (CPPLINT)
    add_custom_target(cpplint
            COMMAND ${CPPLINT} --recursive ${PROJECT_SOURCE_DIR}/**/*.{cpp,cxx,hpp,hxx}
            COMMENT "Cpplint is a command-line tool to check C/C++ files for style issues according to Google's C++ style guide."
            )
else()
    message(WARNING "cpplint not found. The lint target will not be available.\n"
        "To install cpplint, use one of the following commands:\n"
        "For DNF: sudo dnf install cpplint\n"
        "For Homebrew (macOS): brew install cpplint\n"
        "For pip: pip install cpplint\n"
        "Please ensure that cpplint is in your PATH."
    )
endif()
