#include <iostream>
#include <vector>

// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
std::vector<unsigned long> tribonacci(std::size_t count) {
    std::vector<unsigned long> t{0, 0, 1};
    while (t.size() < count) {
        auto n = t.size();
        t.push_back(t[n - 1] + t[n - 2] + t[n - 3]);
    }
    t.resize(count);
    return t;
}

int main() {
    std::cout << "Tribonacci:";
    for (auto x : tribonacci(15)) std::cout << ' ' << x;
    std::cout << '\n';
}
