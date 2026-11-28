#include <iostream>
#include <string>
#include <vector>

bool endsWith(const std::string& s, const std::string& suffix) {
    return s.size() >= suffix.size() &&
           s.compare(s.size() - suffix.size(), suffix.size(), suffix) == 0;
}

int main() {
    std::vector<long> out;
    for (long n = 0; n < 1000; ++n)
        if (endsWith(std::to_string(n * n), std::to_string(n))) out.push_back(n);
    for (long v : out) std::cout << v << ' ';
    std::cout << '\n'; // 0 1 5 6 25 76 376 625
}
