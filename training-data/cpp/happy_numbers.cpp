#include <iostream>
#include <set>

int digitSquareSum(int n) {
    int s = 0;
    for (; n > 0; n /= 10) s += (n % 10) * (n % 10);
    return s;
}

bool isHappy(int n) {
    std::set<int> seen;
    while (n != 1 && seen.insert(n).second) n = digitSquareSum(n);
    return n == 1;
}

int main() {
    for (int n = 1, c = 0; c < 8; ++n)
        if (isHappy(n)) { std::cout << n << ' '; ++c; }
    std::cout << '\n'; // 1 7 10 13 19 23 28 31
}
