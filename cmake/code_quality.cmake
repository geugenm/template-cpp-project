# Add custom targets for formatting, linting, and other checks
include(cmake/code-quality-tools/enable_clang_format.cmake)
include(cmake/code-quality-tools/enable_clang_tidy.cmake)
include(cmake/code-quality-tools/enable_linter.cmake)