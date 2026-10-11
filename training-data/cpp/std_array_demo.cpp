#include <algorithm>
#include <array>
#include <iostream>
#include <numeric>

template <std::size_t N>
int sum(const std::array<int, N>& a) { return std::accumulate(a.begin(), a.end(), 0); }

int main() {
    std::array<int, 5> a{5, 3, 1, 4, 2};
    std::sort(a.begin(), a.end());
    for (int x : a) std::cout << x << ' ';
    std::cout << "\nsize=" << a.size() << " sum=" << sum(a) << "\n";

    std::array<int, 5> b;
    b.fill(7);
    std::cout << (a == b ? "equal" : "different") << " front=" << a.front() << " back=" << a.back() << "\n";
    try { a.at(9) = 1; } catch (const std::out_of_range&) { std::cout << "at() threw out_of_range\n"; }
}
