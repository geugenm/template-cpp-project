#include <cstdlib>
#include <filesystem>
#include <format>
#include <iostream>
#include <string>

int main()
{
    // Get the username
    std::string user_name =
        std::getenv("USER") ? std::getenv("USER") : "Unknown";

    // Get the home directory using std::filesystem
    std::filesystem::path home_dir =
        std::filesystem::path(std::getenv("HOME") ? std::getenv("HOME") : "");

    // Get the shell (fallback to "Unknown" if not available)
    std::string shell = std::getenv("SHELL") ? std::getenv("SHELL") : "Unknown";

    // Get the operating system name (cross-platform fallback)
#ifdef _WIN32
    std::string os = "Windows";
#elif __APPLE__
    std::string os = "macOS";
#elif __linux__
    std::string os = "Linux";
#else
    std::string os = "Unknown OS";
#endif

    // Output information using std::format
    std::cout << std::format("Username: {}\n", user_name);
    std::cout << std::format("Home Directory: {}\n", home_dir.string());
    std::cout << std::format("Shell: {}\n", shell);
    std::cout << std::format("Operating System: {}\n", os);

    return EXIT_SUCCESS;
}