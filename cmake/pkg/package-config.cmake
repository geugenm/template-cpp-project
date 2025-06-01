set(CPACK_PACKAGE_NAME "template_package")
set(CPACK_PACKAGE_VENDOR "glebajk")
set(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_LIST_DIR}/description.txt")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "template-cpp-project")
set(CPACK_PACKAGE_CONTACT "glebajk@gmail.com")
set(CPACK_PACKAGE_ICON "${CMAKE_SOURCE_DIR}/icon.png")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/license")
set(CPACK_RESOURCE_FILE_README "${CMAKE_SOURCE_DIR}/readme.md")
set(CPACK_RESOURCE_FILE_WELCOME "${CMAKE_SOURCE_DIR}/readme.md")

# RPM/DEB specific
set(CPACK_RPM_PACKAGE_DESCRIPTION
    "template-cpp-project. See README.md for details."
)
set(CPACK_RPM_PACKAGE_LICENSE "GPLv2")
set(CPACK_RPM_PACKAGE_GROUP "System")
set(CPACK_RPM_PACKAGE_ARCHITECTURE "x86_64")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION
    "template-cpp-project. See README.md for details."
)
set(CPACK_DEBIAN_PACKAGE_SECTION "utils")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "glebajk@gmail.com")
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "template, libc6")

include(CPack)

cpack_add_component(
    documentation
    DISPLAY_NAME "Documentation"
    DESCRIPTION "Project README and documentation"
    GROUP "Documentation"
    REQUIRED
)

install(
    FILES
        "${CMAKE_SOURCE_DIR}/readme.md"
        "${CMAKE_SOURCE_DIR}/license"
        "${CMAKE_CURRENT_LIST_DIR}/description.txt"
    DESTINATION "share/doc/${PROJECT_NAME}"
    COMPONENT documentation
    PERMISSIONS OWNER_READ GROUP_READ WORLD_READ
)

install(
    FILES "${CMAKE_CURRENT_LIST_DIR}/icon.png"
    DESTINATION "share/pixmaps"
    COMPONENT documentation
)

install(
    FILES "${CMAKE_CURRENT_LIST_DIR}/package.desktop"
    DESTINATION "share/applications"
    COMPONENT documentation
)
