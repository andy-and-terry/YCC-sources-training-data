#include <cstdint>
#include <iostream>
#include <limits>

int main() {
    std::cout << "int:    " << std::numeric_limits<int>::min() << " .. " << std::numeric_limits<int>::max() << "\n";
    std::cout << "uint8:  " << +std::numeric_limits<std::uint8_t>::max() << "\n";
    std::cout << "int64:  " << std::numeric_limits<std::int64_t>::max() << "\n";
    std::cout << "double eps: " << std::numeric_limits<double>::epsilon() << "\n";
    std::cout << "double max: " << std::numeric_limits<double>::max() << "\n";
    std::cout << "has infinity: " << std::numeric_limits<float>::has_infinity << "\n";
    std::cout << "digits10 float/double: " << std::numeric_limits<float>::digits10 << "/" << std::numeric_limits<double>::digits10 << "\n";

    int big = std::numeric_limits<int>::max();
    long long wide = static_cast<long long>(big) + 1;
    std::cout << "widened: " << wide << "\n";
    double nan = std::numeric_limits<double>::quiet_NaN();
    std::cout << "nan == nan: " << (nan == nan) << "\n";
}
