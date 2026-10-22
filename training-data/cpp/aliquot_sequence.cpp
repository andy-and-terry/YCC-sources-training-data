#include <iostream>
#include <vector>

int properDivisorSum(int n) {
    int total = 0;
    for (int d = 1; d < n; ++d) {
        if (n % d == 0) total += d;
    }
    return total;
}

std::vector<int> aliquot(int start) {
    std::vector<int> seq{start};
    while (seq.back() != 0) seq.push_back(properDivisorSum(seq.back()));
    return seq;
}

int main() {
    for (int v : aliquot(12)) std::cout << v << ' ';
    std::cout << '\n';
}
