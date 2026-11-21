#include <iostream>
#include <numeric>
#include <string>
#include <vector>

// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
bool isKeith(int n) {
    std::vector<int> seq;
    for (char c : std::to_string(n)) seq.push_back(c - '0');
    const size_t k = seq.size();
    while (seq.back() < n)
        seq.push_back(std::accumulate(seq.end() - k, seq.end(), 0));
    return seq.back() == n;
}

int main() {
    for (int n = 10; n < 1200; ++n)
        if (isKeith(n)) std::cout << n << ' ';
    std::cout << '\n';
}
