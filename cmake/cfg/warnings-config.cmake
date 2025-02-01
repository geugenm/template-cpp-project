# Option to enable warnings-as-errors
option(WARNINGS_AS_ERRORS "Treat compiler warnings as errors" OFF)

add_library(warnings INTERFACE)

target_compile_features(warnings INTERFACE c_std_23 cxx_std_23)

target_compile_options(
    warnings
    INTERFACE "$<$<CXX_COMPILER_ID:GNU,Clang,AppleClang>:"-Wall
              -Wextra
              -Wpedantic
              -Wconversion
              ">"
              "$<$<CXX_COMPILER_ID:MSVC>:"/W4
              /wd4100
              /wd4505"
    >")

set_target_properties(warnings PROPERTIES CMAKE_COMPILE_WARNINGS_AS_ERROR TRUE)
