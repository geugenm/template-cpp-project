#include <SDL3/SDL.h>
#include <SDL3/SDL_main.h>
#include <cstdlib>

int main(int argc, char* argv[])
{
    if (!SDL_Init(SDL_INIT_EVENTS | SDL_INIT_VIDEO))
    {
        SDL_LogError(SDL_LOG_CATEGORY_APPLICATION,
                     "SDL_Init failed: %s",
                     SDL_GetError());
        return EXIT_FAILURE;
    }

    struct SDLGuard
    {
        ~SDLGuard() { SDL_Quit(); }
    } sdl_guard;

    if (SDL_ShowSimpleMessageBox(
            SDL_MESSAGEBOX_INFORMATION,
            "Hello World",
            "!! Your SDL project successfully runs on Android !!",
            nullptr) != 0) // Prefer nullptr over NULL
    {
        SDL_LogError(SDL_LOG_CATEGORY_APPLICATION,
                     "Message box failed: %s",
                     SDL_GetError());
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}
