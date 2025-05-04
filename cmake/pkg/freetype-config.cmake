cpmaddpackage(
    NAME
    freetype
    GITHUB_REPOSITORY
    aseprite/freetype2
    GIT_TAG
    VER-2-10-0
    VERSION
    2.10.0)

set_target_properties(freetype PROPERTIES CMAKE_RC_FLAGS
                                          "${CMAKE_RC_FLAGS} -c65001")
target_compile_definitions(freetype PRIVATE _UNICODE)

add_library(Freetype::Freetype ALIAS freetype)

set(FREETYPE_FOUND TRUE)
set(FREETYPE_INCLUDE_DIRS "")
set(FREETYPE_LIBRARIES Freetype::Freetype)