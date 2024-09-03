find_package(Doxygen)

if (DOXYGEN_FOUND)
    set(DOXYGEN_INPUT_DIR ${PROJECT_SOURCE_DIR}/src)
    set(DOXYGEN_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/docs/doxygen)
    file(MAKE_DIRECTORY ${DOXYGEN_OUTPUT_DIR})

    set(DOXYGEN_CONFIG ${CMAKE_CURRENT_BINARY_DIR}/doxyfile)

    configure_file(${PROJECT_SOURCE_DIR}/doxyfile.in ${DOXYGEN_CONFIG} @ONLY)

    add_custom_target(doxygen
        COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_CONFIG}
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
        COMMENT "Generating documentation with Doxygen"
        VERBATIM)
else()
    message(WARNING "Doxygen not found. The documentation target will not be available.\n"
        "To install Doxygen, use one of the following commands:\n"
        "For DNF: sudo dnf install doxygen\n"
        "For Homebrew (macOS): brew install doxygen\n"
        "For apt (Ubuntu): sudo apt install doxygen\n"
        "Please ensure that Doxygen is in your PATH."
    )
endif()
