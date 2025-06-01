cpmaddpackage(
    NAME freetype
    GITHUB_REPOSITORY aseprite/freetype2
    GIT_TAG VER-2-10-0
    VERSION 2.10.0
)

# Apply RC flags only for MSVC
set_target_properties(
    freetype
    PROPERTIES
        CMAKE_RC_FLAGS "$<$<C_COMPILER_ID:MSVC>:${CMAKE_RC_FLAGS} /c65001>"
)

# Apply compile options only for MSVC (note: RC flags are for resource compiler, not C/C++)
# If you meant to add compile options for MSVC only, use:
target_compile_options(freetype PRIVATE "$<$<C_COMPILER_ID:MSVC>:/c65001>")
# Or, if you want to append, use a generator expression to only apply for MSVC:
# target_compile_options(freetype PRIVATE "$<$<C_COMPILER_ID:MSVC>:${CMAKE_CXX_FLAGS} /c65001>")

# Apply definition only for MSVC
target_compile_definitions(freetype PRIVATE "$<$<C_COMPILER_ID:MSVC>:_UNICODE>")

add_library(Freetype::Freetype ALIAS freetype)
set(FREETYPE_FOUND TRUE)
set(FREETYPE_INCLUDE_DIRS "")
set(FREETYPE_LIBRARIES Freetype::Freetype)