#include <iostream>

constexpr long double operator""_km(long double v) { return v * 1000.0L; }
constexpr long double operator""_m(long double v) { return v; }

int main() {
    long double total = 1.5_km + 250.0_m;
    std::cout << "total meters: " << total << "\n";
}
