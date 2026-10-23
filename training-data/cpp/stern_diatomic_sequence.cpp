#include <iostream>
#include <vector>

std::vector<int> stern(int count) {
    std::vector<int> s(count + 2, 0);
    s[1] = 1;
    for (int i = 2; i < count; ++i) {
        s[i] = i % 2 == 0 ? s[i / 2] : s[i / 2] + s[i / 2 + 1];
    }
    s.resize(count);
    return s;
}

int main() {
    for (int v : stern(20)) std::cout << v << ' ';
    std::cout << '\n';
}
