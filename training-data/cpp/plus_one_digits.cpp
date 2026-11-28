#include <iostream>
#include <vector>

std::vector<int> plusOne(std::vector<int> d) {
    for (auto it = d.rbegin(); it != d.rend(); ++it) {
        if (*it < 9) {
            ++*it;
            return d;
        }
        *it = 0;
    }
    d.insert(d.begin(), 1);
    return d;
}

int main() {
    for (int x : plusOne({9, 9})) std::cout << x;
    std::cout << '\n';  // 100
}
