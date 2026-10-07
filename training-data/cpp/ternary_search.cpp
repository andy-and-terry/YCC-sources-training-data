#include <cmath>
#include <functional>
#include <iostream>
#include <vector>

int ternary_search(const std::vector<int>& a, int target) {
    int lo = 0, hi = static_cast<int>(a.size()) - 1;
    while (lo <= hi) {
        int m1 = lo + (hi - lo) / 3, m2 = hi - (hi - lo) / 3;
        if (a[m1] == target) return m1;
        if (a[m2] == target) return m2;
        if (target < a[m1]) hi = m1 - 1;
        else if (target > a[m2]) lo = m2 + 1;
        else lo = m1 + 1, hi = m2 - 1;
    }
    return -1;
}

double argmax(const std::function<double(double)>& f, double lo, double hi) {
    for (int i = 0; i < 200; ++i) {
        double m1 = lo + (hi - lo) / 3, m2 = hi - (hi - lo) / 3;
        if (f(m1) < f(m2)) lo = m1;
        else hi = m2;
    }
    return (lo + hi) / 2;
}

int main() {
    std::cout << ternary_search({1, 3, 5, 7, 9, 11, 13}, 9) << '\n';
    std::cout << argmax([](double x) { return -(x - 2) * (x - 2) + 3; }, -10, 10) << ' '
              << argmax([](double x) { return std::sin(x); }, 0, 3) << '\n';
}
