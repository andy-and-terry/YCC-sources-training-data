#include <iomanip>
#include <iostream>

enum class Unit { C, F, K };

constexpr double toCelsius(double v, Unit u) {
    return u == Unit::F ? (v - 32) * 5 / 9 : u == Unit::K ? v - 273.15 : v;
}

constexpr double fromCelsius(double c, Unit u) {
    return u == Unit::F ? c * 9 / 5 + 32 : u == Unit::K ? c + 273.15 : c;
}

constexpr double convert(double v, Unit from, Unit to) { return fromCelsius(toCelsius(v, from), to); }

static_assert(convert(100, Unit::C, Unit::F) == 212);

int main() {
    std::cout << std::fixed << std::setprecision(2) << convert(212, Unit::F, Unit::K) << '\n';
}
