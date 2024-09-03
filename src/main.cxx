#include <iostream>

int main()
{
    std::cout << "hello world!" << std::endl;

    return std::cout.good() ? EXIT_SUCCESS : EXIT_FAILURE;
}
