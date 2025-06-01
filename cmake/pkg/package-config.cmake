# Project metadata
set(PROJECT_VENDOR "geugenm")
set(PROJECT_CONTACT "glebajk@gmail.com")
set(PROJECT_LICENSE "GPLv2")
set(PROJECT_GROUP "System")
set(PROJECT_ARCH "amd64")

# Files and paths
set(PROJECT_ICON_FILE "${CMAKE_CURRENT_LIST_DIR}/icon.png")
set(PROJECT_LICENSE_FILE "${CMAKE_SOURCE_DIR}/license")
set(PROJECT_README_FILE "${CMAKE_SOURCE_DIR}/readme.md")

# CPack configuration
set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_VENDOR "${PROJECT_VENDOR}")
set(CPACK_PACKAGE_CONTACT "${PROJECT_CONTACT}")
set(CPACK_PACKAGE_ICON "${PROJECT_ICON_FILE}")
set(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_LICENSE_FILE}")
set(CPACK_RESOURCE_FILE_README "${PROJECT_README_FILE}")

set(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_LIST_DIR}/description.txt")

# RPM/DEB specific
set(CPACK_RPM_PACKAGE_LICENSE "${PROJECT_LICENSE}")

include(CPack)

configure_file(
    "${CMAKE_CURRENT_LIST_DIR}/package.desktop.in"
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.desktop"
    @ONLY
)

cpack_add_component(
    documentation
    DISPLAY_NAME "Documentation"
    DESCRIPTION "Project readme and documentation"
    GROUP "Documentation"
    REQUIRED
)

install(
    FILES "${PROJECT_README_FILE}" "${PROJECT_LICENSE_FILE}"
    DESTINATION "share/doc/${PROJECT_NAME}"
    COMPONENT documentation
    PERMISSIONS OWNER_READ GROUP_READ WORLD_READ
)

install(FILES "${PROJECT_ICON_FILE}" DESTINATION "share/pixmaps")

install(
    FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.desktop"
    DESTINATION "share/applications"
)
