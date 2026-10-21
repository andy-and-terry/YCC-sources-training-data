// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
#include <iostream>
#include <vector>

std::vector<long> jacobsthal(int count) {
    std::vector<long> terms;
    long a = 0, b = 1;
    for (int i = 0; i < count; ++i) {
        terms.push_back(a);
        long next = b + 2 * a;
        a = b;
        b = next;
    }
    return terms;
}

int main() {
    for (long t : jacobsthal(15)) std::cout << t << ' ';
    std::cout << '\n';
}
