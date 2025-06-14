cpmaddpackage(
    NAME
    SDL3
    GITHUB_REPOSITORY
    libsdl-org/SDL
    GIT_TAG
    8d604353a53853fa56d1bdce0363535605ca868f
    OPTIONS
    "SDL_STATIC OFF"
    "SDL_SHARED ON"
    "SDL_CCACHE ON"
    "SDL_VIDEO_X11 OFF"
    "SDL_WAYLAND ON"
    "SDL_WAYLAND_LIBDECOR OFF"
    "SDL_WAYLAND_LIBDECOR_SHARED OFF"
    "SDL_WAYLAND_QT_TOUCH OFF"
    "SDL_WAYLAND_SHARED OFF"
    "SDL_DISABLE_INSTALL ON"
    "SDL_DISABLE_INSTALL_CPACK ON"
    "SDL_DISABLE_INSTALL_MAN ON"
    "SDL_DISABLE_UNINSTALL ON"
    "SDL_VULKAN OFF"
    "SDL_ASSEMBLY OFF"
    "SDL_TEST OFF"
    "SDL_TESTS OFF"
    "SDL_ROCKCHIP OFF"
)