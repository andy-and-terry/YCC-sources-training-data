#include <cmath>
#include <iostream>
#include <numeric>
#include <valarray>

void print(const char* label, const std::valarray<double>& v) {
    std::cout << label << ':';
    for (double x : v) std::cout << ' ' << x;
    std::cout << '\n';
}

int main() {
    std::valarray<double> a{1.0, 2.0, 3.0, 4.0};
    std::valarray<double> b{10.0, 20.0, 30.0, 40.0};

    // Operators and math functions apply element by element
    print("a + b", a + b);
    print("a * 2", a * 2.0);
    print("sqrt(a)", std::sqrt(a));
    print("b / a", b / a);

    std::cout << "sum(a) = " << a.sum() << ", max(b) = " << b.max() << '\n';

    // Slicing: every other element, and a mask selected by comparison
    std::valarray<double> evens = a[std::slice(1, 2, 2)];  // start 1, 2 items, stride 2
    print("a[1], a[3]", evens);

    std::valarray<bool> big = b > 15.0;
    std::valarray<double> picked = b[big];
    print("b > 15", picked);

    // Assign through a slice
    a[std::slice(0, 2, 2)] = 0.0;
    print("a after zeroing a[0], a[2]", a);

    // Dot product via element-wise multiply + sum
    std::valarray<double> x{1, 2, 3}, y{4, 5, 6};
    std::cout << "dot = " << (x * y).sum() << '\n';
}
