#include <algorithm>
#include <iostream>
#include <string>

bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; ++i)
        if (n % i == 0) return false;
    return true;
}

int reversed(int n) {
    std::string s = std::to_string(n);
    std::reverse(s.begin(), s.end());
    return std::stoi(s);
}

int main() {
    for (int p = 2; p < 200; ++p) {
        int r = reversed(p);
        if (r != p && isPrime(p) && isPrime(r)) std::cout << p << ' ';
    }
    std::cout << '\n'; // 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
}
