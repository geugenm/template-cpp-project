cpmaddpackage(
    NAME
    freetype
    GITHUB_REPOSITORY
    aseprite/freetype2
    GIT_TAG
    VER-2-10-0
    VERSION
    2.10.0)

if(freetype_ADDED)
    add_library(Freetype::Freetype ALIAS freetype)

    set(FREETYPE_FOUND
        TRUE
        FREETYPE_INCLUDE_DIRS
        ""
        FREETYPE_LIBRARIES
        Freetype::Freetype)
endif()
