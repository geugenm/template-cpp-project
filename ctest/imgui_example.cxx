#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include <doctest/doctest.h>

#include <SDL3/SDL.h>
#include <backends/imgui_impl_opengl3.h>
#include <backends/imgui_impl_sdl3.h>
#include <expected>
#include <imgui.h>

struct SDLData
{
    SDL_Window*   window;
    SDL_GLContext gl_ctx;
};

[[nodiscard]] auto init_sdl() -> std::expected<SDLData, const char*>
{
    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_GAMEPAD) != true)
        return std::unexpected(SDL_GetError());

    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK,
                        SDL_GL_CONTEXT_PROFILE_CORE);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 3);

    SDL_Window* window =
        SDL_CreateWindow("ImGui SDL3", 1280, 720, SDL_WINDOW_OPENGL);
    if (!window)
        return std::unexpected(SDL_GetError());

    const SDL_GLContext gl_ctx = SDL_GL_CreateContext(window);
    if (!gl_ctx)
    {
        SDL_DestroyWindow(window);
        return std::unexpected(SDL_GetError());
    }

    SDL_GL_MakeCurrent(window, gl_ctx);
    SDL_GL_SetSwapInterval(1);
    return SDLData{ window, gl_ctx };
}

TEST_CASE("SDL initialization")
{
    auto sdl_data = init_sdl();
    REQUIRE(sdl_data.has_value());

    SUBCASE("Window creation")
    {
        CHECK(sdl_data->window != nullptr);
    }

    SUBCASE("OpenGL context")
    {
        CHECK(sdl_data->gl_ctx != nullptr);
    }

    // Cleanup
    SDL_GL_DestroyContext(sdl_data->gl_ctx);
    SDL_DestroyWindow(sdl_data->window);
    SDL_Quit();
}

TEST_CASE("ImGui integration")
{
    auto sdl_data = init_sdl();
    REQUIRE(sdl_data.has_value());

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();

    SUBCASE("Backend initialization")
    {
        CHECK(ImGui_ImplSDL3_InitForOpenGL(sdl_data->window, sdl_data->gl_ctx));
        CHECK(ImGui_ImplOpenGL3_Init("#version 330"));

        // Teardown
        ImGui_ImplOpenGL3_Shutdown();
        ImGui_ImplSDL3_Shutdown();
    }

    ImGui::DestroyContext();
    SDL_GL_DestroyContext(sdl_data->gl_ctx);
    SDL_DestroyWindow(sdl_data->window);
    SDL_Quit();
}

TEST_CASE("Main loop execution")
{
    const auto sdl_data = init_sdl();
    REQUIRE(sdl_data.has_value());

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGui_ImplSDL3_InitForOpenGL(sdl_data->window, sdl_data->gl_ctx);
    ImGui_ImplOpenGL3_Init("#version 330");

    SUBCASE("Frame rendering")
    {
        REQUIRE_NOTHROW(
            [&]()
            {
                ImGui_ImplOpenGL3_NewFrame();
                ImGui_ImplSDL3_NewFrame();
                ImGui::NewFrame();
                ImGui::Render();
            }());
    }

    SUBCASE("Event handling")
    {
        SDL_Event quit_event{};
        quit_event.type = SDL_EVENT_QUIT;
        SDL_PushEvent(&quit_event);

        SDL_Event event;
        while (SDL_PollEvent(&event))
        {
            ImGui_ImplSDL3_ProcessEvent(&event);
        }
    }

    // Cleanup
    ImGui_ImplOpenGL3_Shutdown();
    ImGui_ImplSDL3_Shutdown();
    ImGui::DestroyContext();
    SDL_GL_DestroyContext(sdl_data->gl_ctx);
    SDL_DestroyWindow(sdl_data->window);
    SDL_Quit();
}
