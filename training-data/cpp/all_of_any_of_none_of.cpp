#include <algorithm>
#include <iostream>
#include <vector>

int main() {
    std::vector<int> v{2, 4, 6, 8};
    auto even = [](int x) { return x % 2 == 0; };
    auto big = [](int x) { return x > 7; };

    std::cout << std::boolalpha;
    std::cout << "all even: " << std::all_of(v.begin(), v.end(), even) << "\n";
    std::cout << "any big: " << std::any_of(v.begin(), v.end(), big) << "\n";
    std::cout << "none negative: "
              << std::none_of(v.begin(), v.end(), [](int x) { return x < 0; })
              << "\n";

    // Empty ranges: all_of and none_of are true, any_of is false.
    std::vector<int> empty;
    std::cout << std::all_of(empty.begin(), empty.end(), big) << " "
              << std::any_of(empty.begin(), empty.end(), big) << "\n";

    auto it = std::find_if(v.begin(), v.end(), big);
    std::cout << "first big at index " << (it - v.begin()) << "\n";
    return 0;
}
