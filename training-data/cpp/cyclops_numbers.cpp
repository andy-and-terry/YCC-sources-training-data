#include <algorithm>
#include <iostream>
#include <string>

// Cyclops numbers: odd digit count, middle digit zero, no other zeros.
// Count those in 1..99999 (expected 6642).
bool isCyclops(int n) {
    std::string s = std::to_string(n);
    return s.size() % 2 == 1 && s[s.size() / 2] == '0' && std::count(s.begin(), s.end(), '0') == 1;
}

int main() {
    int count = 0;
    for (int n = 1; n < 100000; ++n)
        if (isCyclops(n)) ++count;
    std::cout << count << '\n';
}
