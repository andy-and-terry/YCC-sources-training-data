#include <iostream>
#include <string>

bool luhnValid(const std::string& input) {
    std::string s;
    for (char c : input) {
        if (c == ' ') continue;
        if (c < '0' || c > '9') return false;
        s += c;
    }
    if (s.size() < 2) return false;
    int sum = 0;
    for (size_t i = 0; i < s.size(); ++i) {
        int d = s[s.size() - 1 - i] - '0';
        if (i % 2 == 1 && (d *= 2) > 9) d -= 9;
        sum += d;
    }
    return sum % 10 == 0;
}

int main() {
    std::cout << std::boolalpha << luhnValid("4539 3195 0343 6467") << ' ' << luhnValid("8273 1232 7352 0569") << '\n';
}
