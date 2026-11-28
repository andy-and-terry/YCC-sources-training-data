#include <algorithm>
#include <iostream>
#include <vector>

int main() {
    std::vector<int> a{10, 9, 2, 5, 3, 7, 101, 18}, tails;
    for (int x : a) {
        auto it = std::lower_bound(tails.begin(), tails.end(), x);
        if (it == tails.end()) tails.push_back(x); else *it = x;
    }
    std::cout << tails.size() << '\n';
}
