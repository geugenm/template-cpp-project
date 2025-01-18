set(DOCTEST_VERSION "2.4.6")

CPMAddPackage(
    NAME
    doctest
    GITHUB_REPOSITORY
    doctest/doctest
    VERSION
    2.4.11
    OPTIONS
    "DOCTEST_WITH_TESTS OFF")

if(doctest_ADDED AND doctest_VERSION)
    if(doctest_VERSION VERSION_GREATER DOCTEST_VERSION)
        message(
            WARNING
                "A newer version of Doctest (${doctest_VERSION}) is available. Consider updating to stay up-to-date."
            )
    endif()
endif()
