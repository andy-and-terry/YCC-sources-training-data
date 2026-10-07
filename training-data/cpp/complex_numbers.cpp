#include <complex>
#include <iomanip>
#include <iostream>
#include <numbers>
#include <vector>

using cd = std::complex<double>;

// Recursive FFT and its inverse; used to multiply polynomials.
void fft(std::vector<cd>& a, bool invert) {
    const std::size_t n = a.size();
    if (n == 1) return;
    std::vector<cd> even(n / 2), odd(n / 2);
    for (std::size_t i = 0; i < n / 2; ++i) even[i] = a[2 * i], odd[i] = a[2 * i + 1];
    fft(even, invert);
    fft(odd, invert);
    double ang = 2 * std::numbers::pi / static_cast<double>(n) * (invert ? 1 : -1);
    for (std::size_t k = 0; k < n / 2; ++k) {
        cd t = std::polar(1.0, ang * static_cast<double>(k)) * odd[k];
        a[k] = even[k] + t;
        a[k + n / 2] = even[k] - t;
        if (invert) a[k] /= 2, a[k + n / 2] /= 2;
    }
}

std::vector<long> multiply(const std::vector<long>& a, const std::vector<long>& b) {
    std::size_t n = 1;
    while (n < a.size() + b.size()) n <<= 1;
    std::vector<cd> fa(a.begin(), a.end()), fb(b.begin(), b.end());
    fa.resize(n);
    fb.resize(n);
    fft(fa, false);
    fft(fb, false);
    for (std::size_t i = 0; i < n; ++i) fa[i] *= fb[i];
    fft(fa, true);
    std::vector<long> out(a.size() + b.size() - 1);
    for (std::size_t i = 0; i < out.size(); ++i) out[i] = std::lround(fa[i].real());
    return out;
}

int main() {
    cd z1{3, 4}, z2{1, -2};
    std::cout << std::fixed << std::setprecision(3) << z1 * z2 << ' ' << z1 / z2 << ' ' << std::abs(z1) << '\n';
    std::cout << std::exp(cd{0, std::numbers::pi}) << '\n';
    for (long c : multiply({1, 2, 3}, {4, 5})) std::cout << c << ' ';
    std::cout << " (= (1+2x+3x^2)(4+5x))\n";
}
