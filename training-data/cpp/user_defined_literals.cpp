#include <cstddef>
#include <iostream>
#include <string>

struct Meters {
    long double value;
};

constexpr Meters operator""_m(long double v) { return {v}; }
constexpr Meters operator""_km(long double v) { return {v * 1000.0L}; }
constexpr Meters operator""_cm(long double v) { return {v / 100.0L}; }

constexpr Meters operator+(Meters a, Meters b) { return {a.value + b.value}; }

constexpr unsigned long long operator""_KiB(unsigned long long n) { return n * 1024; }
constexpr unsigned long long operator""_MiB(unsigned long long n) { return n * 1024 * 1024; }

std::string operator""_upper(const char* s, std::size_t len) {
    std::string out(s, len);
    for (char& c : out) {
        if (c >= 'a' && c <= 'z') c = static_cast<char>(c - 'a' + 'A');
    }
    return out;
}

int main() {
    Meters total = 1.5_km + 250.0_m + 30.0_cm;
    std::cout << "total meters: " << static_cast<double>(total.value) << std::endl;

    std::cout << "4 KiB  = " << 4_KiB << " bytes" << std::endl;
    std::cout << "2 MiB  = " << 2_MiB << " bytes" << std::endl;
    std::cout << "hello"_upper << std::endl;

    static_assert(1_KiB == 1024, "literal evaluated at compile time");
    return 0;
}
