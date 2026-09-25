#include <bitset>
#include <iostream>

int binaryGap(unsigned n) {
    int best = 0, last = -1;
    for (int i = 0; n; ++i, n >>= 1) {
        if (n & 1u) {
            if (last >= 0) best = std::max(best, i - last - 1);
            last = i;
        }
    }
    return best;
}

int main() {
    for (unsigned n : {9u, 529u, 20u, 15u, 1041u})
        std::cout << n << ' ' << std::bitset<12>(n) << ' ' << binaryGap(n) << '\n';
}
