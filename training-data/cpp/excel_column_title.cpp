#include <algorithm>
#include <iostream>
#include <string>

std::string columnTitle(int n) {
    std::string out;
    while (n > 0) {
        --n;
        out.push_back(static_cast<char>('A' + n % 26));
        n /= 26;
    }
    std::reverse(out.begin(), out.end());
    return out;
}

int main() {
    std::cout << columnTitle(28) << ' ' << columnTitle(701) << '\n';  // AB ZY
}
