#include <iostream>
#include <vector>

std::vector<long long> zeckendorf(long long n) {
    std::vector<long long> fibs = {1, 2};
    while (fibs.back() <= n) {
        fibs.push_back(fibs[fibs.size() - 1] + fibs[fibs.size() - 2]);
    }
    std::vector<long long> parts;
    for (auto it = fibs.rbegin(); it != fibs.rend(); ++it) {
        if (*it <= n) {
            parts.push_back(*it);
            n -= *it;
        }
    }
    return parts;
}

int main() {
    auto parts = zeckendorf(100);
    for (size_t i = 0; i < parts.size(); i++) {
        std::cout << (i ? " " : "") << parts[i];
    }
    std::cout << "\n";
    return 0;
}
