#include <cstdint>
#include <iostream>

// Scoped enum with an explicit underlying type; no implicit int conversion.
enum class Color : std::uint8_t { Red = 1, Green = 2, Blue = 4 };

constexpr Color operator|(Color a, Color b) {
    return static_cast<Color>(static_cast<std::uint8_t>(a) | static_cast<std::uint8_t>(b));
}

int main() {
    Color c = Color::Red | Color::Blue;
    std::cout << static_cast<int>(c) << " " << sizeof(Color) << "\n";
}
