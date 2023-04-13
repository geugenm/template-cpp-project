#include <iostream>
#include <cstdlib>

int main() {
    // Attempt to output the "Hello, world!" message to the console
    if (std::cout << "Hello, world!\n") {
        // If the output was successful, exit with a success status code
        return EXIT_SUCCESS;
    } else {
        // If the output failed, print an error message and exit with a failure status code
        std::cerr << "Error: Output stream is in a bad state!\n";
        return EXIT_FAILURE;
    }
}
