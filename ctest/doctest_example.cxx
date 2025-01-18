#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include <doctest/doctest.h>

// Function to test
int factorial(int n)
{
    return n <= 1 ? 1 : n * factorial(n - 1);
}

// Test cases
TEST_CASE("Factorial function")
{
    CHECK(factorial(0) == 1);        // Should pass
    CHECK(factorial(1) == 1);        // Should pass
    CHECK(factorial(2) == 2);        // Should pass
    CHECK(factorial(3) == 6);        // Should pass
    CHECK(factorial(10) == 3628800); // Should pass
}