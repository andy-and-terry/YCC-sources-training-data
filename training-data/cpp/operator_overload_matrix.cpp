#include <array>
#include <iostream>

struct M2 {
    std::array<std::array<int, 2>, 2> a;
    M2 operator*(const M2& o) const {
        M2 r{};
        for (int i = 0; i < 2; i++) for (int j = 0; j < 2; j++) for (int k = 0; k < 2; k++) r.a[i][j] += a[i][k] * o.a[k][j];
        return r;
    }
    int& operator()(int i, int j) { return a[i][j]; }
};

std::ostream& operator<<(std::ostream& os, const M2& m) { return os << m.a[0][0] << m.a[0][1] << m.a[1][0] << m.a[1][1]; }

int main() { M2 f{{{{1, 1}, {1, 0}}}}; M2 r = f * f * f * f; r(0, 0) += 0; std::cout << r << "\n"; }
