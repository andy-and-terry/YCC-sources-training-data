#include <algorithm>
#include <iostream>
#include <string>

// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
bool isBouncy(int n) {
    std::string s = std::to_string(n);
    return !std::is_sorted(s.begin(), s.end()) &&
           !std::is_sorted(s.rbegin(), s.rend());
}

int main() {
    int count = 0;
    for (int n = 1; n < 1000; ++n)
        if (isBouncy(n)) ++count;
    std::cout << count << '\n';
}
