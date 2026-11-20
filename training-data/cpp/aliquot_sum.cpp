#include <iostream>
#include <string>
// Aliquot sum classification.
int aliquot(int n) { int s = 0; for (int d = 1; d < n; d++) if (n % d == 0) s += d; return s; }
int main() {
    for (int n : {6, 12, 15, 28}) {
        int a = aliquot(n);
        std::string kind = a == n ? "perfect" : a > n ? "abundant" : "deficient";
        std::cout << n << ' ' << a << ' ' << kind << '\n';
    }
}
