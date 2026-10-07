#include <bitset>
#include <iostream>
#include <vector>

unsigned toGray(unsigned n) { return n ^ (n >> 1); }

unsigned fromGray(unsigned g) {
    unsigned n = 0;
    for (; g; g >>= 1) n ^= g;
    return n;
}

std::vector<unsigned> graySequence(int bits) {
    std::vector<unsigned> seq;
    for (unsigned i = 0; i < (1u << bits); ++i) seq.push_back(toGray(i));
    return seq;
}

int main() {
    for (unsigned g : graySequence(3)) {
        std::cout << std::bitset<3>(g) << " (back to " << fromGray(g) << ")" << std::endl;
    }
    return 0;
}
