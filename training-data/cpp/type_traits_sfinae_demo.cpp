#include <iostream>
#include <type_traits>
#include <vector>

// SFINAE via std::enable_if: only participates in overload resolution for
// arithmetic types.
template <typename T, typename std::enable_if<std::is_arithmetic<T>::value, int>::type = 0>
T doubleValue(T x) {
    return x + x;
}

// A second overload for types with a "value_type" (containers), also picked
// via SFINAE (detects the nested typedef through a defaulted template arg).
template <typename Container, typename = typename Container::value_type>
typename Container::value_type sumAll(const Container& c) {
    typename Container::value_type total{};
    for (const auto& item : c) total += item;
    return total;
}

// A compile-time trait computed with plain template metaprogramming.
template <int N>
struct Factorial {
    static constexpr long long value = N * Factorial<N - 1>::value;
};

template <>
struct Factorial<0> {
    static constexpr long long value = 1;
};

int main() {
    std::cout << "doubleValue(21) = " << doubleValue(21) << std::endl;
    std::cout << "doubleValue(1.5) = " << doubleValue(1.5) << std::endl;

    std::vector<int> nums = {1, 2, 3, 4, 5};
    std::cout << "sumAll(nums) = " << sumAll(nums) << std::endl;

    static_assert(Factorial<5>::value == 120, "5! should be 120");
    std::cout << "Factorial<5>::value = " << Factorial<5>::value << std::endl;

    std::cout << std::boolalpha
               << "is_arithmetic<int> = " << std::is_arithmetic<int>::value << std::endl;
    std::cout << "is_arithmetic<std::vector<int>> = "
               << std::is_arithmetic<std::vector<int>>::value << std::endl;

    return 0;
}
