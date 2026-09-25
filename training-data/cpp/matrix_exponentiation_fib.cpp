#include <array>
#include <cstdint>
#include <iostream>

template <std::size_t N>
using Mat = std::array<std::array<std::uint64_t, N>, N>;

constexpr std::uint64_t MOD = 1'000'000'007;

template <std::size_t N>
Mat<N> operator*(const Mat<N>& a, const Mat<N>& b) {
    Mat<N> c{};
    for (std::size_t i = 0; i < N; ++i)
        for (std::size_t k = 0; k < N; ++k)
            for (std::size_t j = 0; j < N; ++j) c[i][j] = (c[i][j] + a[i][k] * b[k][j]) % MOD;
    return c;
}

template <std::size_t N>
Mat<N> mat_pow(Mat<N> m, std::uint64_t e) {
    Mat<N> r{};
    for (std::size_t i = 0; i < N; ++i) r[i][i] = 1;
    for (; e; e >>= 1, m = m * m)
        if (e & 1) r = r * m;
    return r;
}

std::uint64_t fib(std::uint64_t n) { return mat_pow<2>({{{1, 1}, {1, 0}}}, n)[0][1]; }

int main() {
    for (int i = 0; i < 15; ++i) std::cout << fib(static_cast<std::uint64_t>(i)) << ' ';
    std::cout << "\nfib(1e18) mod p = " << fib(1'000'000'000'000'000'000ull) << '\n';
}
