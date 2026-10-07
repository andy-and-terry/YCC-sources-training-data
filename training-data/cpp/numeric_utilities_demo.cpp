#include <algorithm>
#include <bit>
#include <cstdint>
#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::cout << "gcd(48, 18)    = " << std::gcd(48, 18) << std::endl;
    std::cout << "lcm(4, 6)      = " << std::lcm(4, 6) << std::endl;
    std::cout << "clamp(15,0,10) = " << std::clamp(15, 0, 10) << std::endl;
    std::cout << "midpoint(1,10) = " << std::midpoint(1, 10) << std::endl;
    std::cout << "midpoint(max)  = " << std::midpoint(INT32_MAX, INT32_MAX - 2) << std::endl;

    std::vector<int> v{3, 1, 4, 1, 5, 9, 2, 6};
    auto [mn, mx] = std::minmax_element(v.begin(), v.end());
    std::cout << "min/max        = " << *mn << "/" << *mx << std::endl;

    std::vector<int> prefix(v.size());
    std::partial_sum(v.begin(), v.end(), prefix.begin());
    std::cout << "prefix sums    = ";
    for (int x : prefix) std::cout << x << ' ';
    std::cout << std::endl;

    std::vector<int> diffs(v.size());
    std::adjacent_difference(v.begin(), v.end(), diffs.begin());
    std::cout << "differences    = ";
    for (int x : diffs) std::cout << x << ' ';
    std::cout << std::endl;

    std::cout << "dot product    = " << std::inner_product(v.begin(), v.end(), v.begin(), 0) << std::endl;
    std::cout << "reduce         = " << std::reduce(v.begin(), v.end(), 0) << std::endl;

    std::uint32_t bits = 0b10110000;
    std::cout << "popcount       = " << std::popcount(bits) << std::endl;
    std::cout << "bit_width      = " << std::bit_width(bits) << std::endl;
    std::cout << "countr_zero    = " << std::countr_zero(bits) << std::endl;
    std::cout << "has_single_bit = " << std::has_single_bit(64u) << std::endl;
    std::cout << "bit_ceil(100)  = " << std::bit_ceil(100u) << std::endl;
    std::cout << "rotl           = " << std::rotl(0x80000001u, 1) << std::endl;
    return 0;
}
