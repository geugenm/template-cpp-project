#include <iostream>

void print_program_configuration(int argc, char *argv[], char *envp[])
{
    std::cout << "Running with " << argc << " arguments:\n";

    std::cout << "> Arguments: \n";
    for (int i = 0; i < argc; ++i)
        std::cout << argv[i] << "\n";

    std::cout << "> Environment: \n";
    for (int i = 0; envp[i]; ++i)
        std::cout << envp[i] << "\n";

    std::cout << std::endl;
}

int main(int argc, char *argv[], char *envp[])
{
    print_program_configuration(argc, argv, envp);

    std::cout << "Test output!" << std::endl;

    return std::cout.good() ? EXIT_SUCCESS : EXIT_FAILURE;
}