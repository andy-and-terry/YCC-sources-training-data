#include <iostream>

// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
// unsigned long long holds the first 7 terms.
int main() {
    unsigned long long s = 2;
    for (int i = 0; i < 7; ++i) {
        std::cout << "s(" << i << ") = " << s << '\n';
        s = s * s - s + 1;
    }
}
