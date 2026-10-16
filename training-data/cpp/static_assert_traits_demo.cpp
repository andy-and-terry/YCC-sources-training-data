#include <iostream>
#include <mutex>
#include <string>
#include <type_traits>

template <typename T>
T twice(T x) {
    static_assert(std::is_arithmetic_v<T>, "twice requires an arithmetic type");
    return x * 2;
}

static_assert(sizeof(int) >= 4);
static_assert(std::is_same_v<std::remove_reference_t<int&>, int>);
static_assert(std::is_base_of_v<std::exception, std::runtime_error>);
static_assert(!std::is_copy_constructible_v<std::mutex>);

int main() {
    std::cout << twice(21) << " " << twice(1.25) << "\n";
    std::cout << std::boolalpha;
    std::cout << std::is_integral_v<long> << " " << std::is_pointer_v<int*> << " "
              << std::is_const_v<const int> << " " << std::is_trivially_copyable_v<std::string> << "\n";
    using T = std::decay_t<const int&>;
    std::cout << std::is_same_v<T, int> << " " << std::is_signed_v<unsigned> << "\n";
}
