#include <SDL3/SDL.h>
#include <SDL3/SDL_log.h>
#include <SDL3/SDL_main.h>

SDL_Window*   window   = nullptr;
SDL_Renderer* renderer = nullptr;

extern "C" void SDL_AppInit()
{
    SDL_Init(SDL_INIT_VIDEO);

    window   = SDL_CreateWindow("SDL3 Android", 800, 600, 0);
    renderer = SDL_CreateRenderer(window, nullptr);

    SDL_Log("SDL3 initialized successfully!");
}

extern "C" void SDL_AppIterate()
{
    SDL_Event event;
    while (SDL_PollEvent(&event))
    {
        if (event.type == SDL_EVENT_QUIT)
        {
            SDL_Log("Quit event received");
            SDL_DestroyRenderer(renderer);
            SDL_DestroyWindow(window);
            SDL_Quit();
        }
    }

    SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
    SDL_RenderClear(renderer);
    SDL_RenderPresent(renderer);
}