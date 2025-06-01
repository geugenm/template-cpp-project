#include <chrono>
#include <cstdlib>
#include <filesystem>
#include <format>
#include <iostream>
#include <string>
#include <thread>

#ifdef _WIN32
#include <windows.h>
#else
#include <sys/utsname.h>
#endif

[[nodiscard]] std::string get_env(const char*        var_name,
                                  const std::string& default_value = "Unknown")
{
    const char* value = std::getenv(var_name);
    return value ? std::string(value) : default_value;
}

[[nodiscard]] std::string get_os_info()
{
#ifdef _WIN32
    char os_name[128];
    if (GetVersionExA((LPOSVERSIONINFOA)&os_name))
    {
        return "Windows";
    }
    return "Windows (Unknown Version)";
#else
    // Unix-like systems: Use uname()
    struct utsname buffer;
    if (uname(&buffer) == 0)
    {
        return std::format(
            "{} {} ({})", buffer.sysname, buffer.release, buffer.machine);
    }
    return "Unknown Unix-like OS";
#endif
}

// Function to get the current timestamp in ISO 8601 format
[[nodiscard]] std::string get_current_timestamp()
{
    auto    now        = std::chrono::system_clock::now();
    auto    time_t_now = std::chrono::system_clock::to_time_t(now);
    std::tm local_tm   = *std::localtime(&time_t_now);

    return std::format("{:04}-{:02}-{:02}T{:02}:{:02}:{:02}",
                       local_tm.tm_year + 1900,
                       local_tm.tm_mon + 1,
                       local_tm.tm_mday,
                       local_tm.tm_hour,
                       local_tm.tm_min,
                       local_tm.tm_sec);
}

void log_info(const std::string& key, const std::string& value)
{
    std::cout << std::format(
        "{} [system] {}: {}\n", get_current_timestamp(), key, value);
}

int main()
{
    const std::string           user_name = get_env("USER", "Unknown");
    const std::filesystem::path home_dir  = get_env("HOME", "");
    const std::string           shell     = get_env("SHELL", "Unknown");
    const std::string           os_info   = get_os_info();

    log_info("username", user_name);
    log_info("home_directory", home_dir.string());
    log_info("shell", shell);
    log_info("os", os_info);

#ifdef _WIN32
    log_info("platform", "Windows");
#else
    log_info("platform", "Unix-like");
#endif

    log_info("threads_supported",
             std::to_string(std::thread::hardware_concurrency()));

    std::cerr << "test output to std:cerr stream" << std::endl;

    return std::cout.good() ? EXIT_SUCCESS : EXIT_FAILURE;
}