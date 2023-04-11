find_program(CPPLINT "cpplint")
if (CPPLINT)
    add_custom_target(lint
            COMMAND ${CPPLINT} --recursive ${PROJECT_SOURCE_DIR}/src/*.cpp ${PROJECT_SOURCE_DIR}/include/*.hpp ${PROJECT_SOURCE_DIR}/test/*.cpp
            COMMENT "Linting code..."
            )
else()
    message(WARNING "cpplint not found. The lint target will not be available.")
endif ()
