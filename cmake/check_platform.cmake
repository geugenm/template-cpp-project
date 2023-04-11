if (NOT WIN32 AND NOT UNIX AND NOT APPLE AND NOT ANDROID)
    message(FATAL_ERROR "Platform not supported")
endif()