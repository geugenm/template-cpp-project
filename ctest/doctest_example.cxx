#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include <doctest/doctest.h>

[[nodiscard]] constexpr int32_t factorial(const int32_t& n) noexcept
{
    return n <= 1 ? 1 : n * factorial(n - 1);
}

TEST_CASE("Factorial function")
{
    CHECK(factorial(0) == 1);
    CHECK(factorial(1) == 1);
    CHECK(factorial(2) == 2);
    CHECK(factorial(3) == 6);
    CHECK(factorial(10) == 3628800);
}