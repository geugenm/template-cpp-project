cpmaddpackage(
    NAME
    doctest
    GITHUB_REPOSITORY
    doctest/doctest
    VERSION
    2.4.12
    DOWNLOAD_ONLY TRUE
    OPTIONS
    "DOCTEST_WITH_TESTS OFF"
)

add_subdirectory(
    ${doctest_SOURCE_DIR}
    ${doctest_BINARY_DIR}
    SYSTEM
    EXCLUDE_FROM_ALL
)