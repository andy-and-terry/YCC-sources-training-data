#include <array>
#include <iostream>

using Mat = std::array<std::array<unsigned long long, 2>, 2>;

Mat multiply(const Mat &a, const Mat &b) {
    Mat r{};
    for (int i = 0; i < 2; ++i)
        for (int j = 0; j < 2; ++j)
            for (int k = 0; k < 2; ++k)
                r[i][j] += a[i][k] * b[k][j];
    return r;
}

unsigned long long fib(unsigned n) {
    Mat result = {{{1, 0}, {0, 1}}};
    Mat base = {{{1, 1}, {1, 0}}};
    while (n) {
        if (n & 1) result = multiply(result, base);
        base = multiply(base, base);
        n >>= 1;
    }
    return result[0][1];
}

int main() {
    for (unsigned n : {1u, 10u, 50u, 90u}) {
        std::cout << "fib(" << n << ") = " << fib(n) << std::endl;
    }
    return 0;
}
