#include <algorithm>
#include <iostream>
#include <string>

bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; ++i)
        if (n % i == 0) return false;
    return true;
}

bool isPalindrome(int n) {
    std::string s = std::to_string(n);
    return std::equal(s.begin(), s.begin() + s.size() / 2, s.rbegin());
}

int main() {
    for (int n = 2; n < 200; ++n)
        if (isPalindrome(n) && isPrime(n)) std::cout << n << ' ';
    std::cout << '\n'; // 2 3 5 7 11 101 131 151 181 191
}
