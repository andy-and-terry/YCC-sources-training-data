#include <algorithm>
#include <iostream>
#include <numeric>
#include <string>
#include <vector>

int main() {
    std::string s = "banana$";
    int n = s.size();
    std::vector<int> idx(n);
    std::iota(idx.begin(), idx.end(), 0);
    std::sort(idx.begin(), idx.end(), [&](int a, int b) {
        return s.substr(a) + s.substr(0, a) < s.substr(b) + s.substr(0, b);
    });
    for (int i : idx) std::cout << s[(i + n - 1) % n];
    std::cout << '\n';
}
