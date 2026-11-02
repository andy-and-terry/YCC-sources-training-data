#include <iostream>

constexpr unsigned long long fact(unsigned n) { return n < 2 ? 1 : n * fact(n - 1); }
static_assert(fact(5) == 120);

int main() { std::cout << fact(10) << "\n"; }
