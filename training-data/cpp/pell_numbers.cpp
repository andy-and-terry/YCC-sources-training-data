#include <iostream>
#include <vector>

// P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
std::vector<long long> pell(int count) {
    std::vector<long long> p{0, 1};
    for (int i = 2; i < count; ++i) p.push_back(2 * p[i - 1] + p[i - 2]);
    return p;
}

int main() {
    auto terms = pell(15);
    for (std::size_t i = 0; i < terms.size(); ++i)
        std::cout << "P(" << i << ") = " << terms[i] << '\n';
}
