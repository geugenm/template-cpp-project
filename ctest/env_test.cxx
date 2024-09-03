#include <cstdlib>
#include <format>
#include <iostream>
#include <pwd.h>
#include <string>
#include <unistd.h>

int main()
{
    const std::string user_name = getpwuid(getuid())->pw_name;
    const char*       home_dir  = getpwuid(getuid())->pw_dir;
    const char*       shell     = getpwuid(getuid())->pw_shell;
    const char*       os        = getenv("OS");
    const char*       user      = getenv("USER");

    std::cout << std::format("Username: {}\n", user_name);
    std::cout << std::format("Home Directory: {}\n", home_dir);
    std::cout << std::format("Shell: {}\n", shell);
    std::cout << std::format("OS: {}\n", os ? os : "Unknown");
    std::cout << std::format("User: {}\n", user ? user : "Unknown");

    return std::cout.good() ? EXIT_SUCCESS : EXIT_FAILURE;
}
