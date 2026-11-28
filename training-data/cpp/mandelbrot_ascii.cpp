#include <complex>
#include <iostream>

int main() {
    using C = std::complex<double>;
    for (double y = -1.0; y <= 1.0; y += 0.2) {
        for (double x = -2.0; x <= 0.6; x += 0.05) {
            C z = 0, c(x, y);
            int n = 0;
            while (n < 30 && std::norm(z) < 4) { z = z * z + c; ++n; }
            std::cout << (n == 30 ? '#' : '.');
        }
        std::cout << '\n';
    }
}
