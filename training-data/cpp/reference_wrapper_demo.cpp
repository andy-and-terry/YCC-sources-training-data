#include <algorithm>
#include <functional>
#include <iostream>
#include <vector>

void increment(int& x) { ++x; }

int main() {
    int a = 1, b = 2, c = 3;
    std::vector<std::reference_wrapper<int>> refs{a, b, c};
    for (auto& r : refs) r.get() *= 10;
    std::cout << a << " " << b << " " << c << "\n";

    std::sort(refs.begin(), refs.end(), std::greater<int>());
    std::cout << refs[0].get() << " " << refs[2].get() << "\n";

    int n = 0;
    auto by_value = std::bind(increment, n);
    auto by_ref = std::bind(increment, std::ref(n));
    by_value(); by_value();
    by_ref();
    std::cout << "n=" << n << "\n";
}
