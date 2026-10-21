#include <iostream>
#include <vector>

// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
std::vector<long> padovan(int count) {
    std::vector<long> p(count, 1);
    for (int i = 3; i < count; ++i) p[i] = p[i - 2] + p[i - 3];
    return p;
}

int main() {
    for (long v : padovan(15)) std::cout << v << ' ';
    std::cout << '\n';
}
