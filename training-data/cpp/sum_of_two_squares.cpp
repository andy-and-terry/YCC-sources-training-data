#include <iostream>
#include <vector>

// Positive n expressible as a*a + b*b with a, b >= 0.
bool representable(int n) {
    for (int a = 0; a * a <= n; ++a)
        for (int b = a; a * a + b * b <= n; ++b)
            if (a * a + b * b == n) return true;
    return false;
}

int main() {
    std::vector<int> out;
    for (int n = 1; n <= 30; ++n)
        if (representable(n)) out.push_back(n);
    for (int v : out) std::cout << v << ' ';
    std::cout << '\n';
}
