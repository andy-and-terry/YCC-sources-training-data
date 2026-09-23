#include <iostream>

// User-defined literal operators let a suffix attach a unit's meaning
// directly to a numeric constant, catching unit-mismatch bugs at the
// call site instead of deep inside a computation.
constexpr long double operator"" _km(long double value) {
    return value * 1000.0L;
}

constexpr long double operator"" _m(long double value) {
    return value;
}

constexpr unsigned long long operator"" _kb(unsigned long long value) {
    return value * 1024ULL;
}

int main() {
    long double distance = 1.5_km + 250.0_m;
    std::cout << "distance in meters: " << distance << std::endl;

    unsigned long long bufferSize = 4_kb;
    std::cout << "buffer size in bytes: " << bufferSize << std::endl;
    return 0;
}
