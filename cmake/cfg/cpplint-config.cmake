find_program(CPPLINT "cpplint")

if(CPPLINT)
    add_custom_target(
        cpplint
        COMMAND
            ${CPPLINT} --recursive ${PROJECT_SOURCE_DIR}/**/*.{cpp,cxx,hpp,hxx}
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
