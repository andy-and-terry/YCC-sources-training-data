#include <iostream>
#include <unordered_set>

int next_value(int n) {
    int s = 0;
    for (; n; n /= 10) s += (n % 10) * (n % 10);
    return s;
}

bool is_happy(int n) {
    std::unordered_set<int> seen;
    while (n != 1 && seen.insert(n).second) n = next_value(n);
    return n == 1;
}

int main() {
    int count = 0;
    for (int i = 1; i <= 1000; ++i) {
        if (!is_happy(i)) continue;
        if (i <= 50) std::cout << i << ' ';
        ++count;
    }
    std::cout << "\nhappy numbers up to 1000: " << count << '\n';
}
