#include <algorithm>
#include <cctype>
#include <iostream>
#include <numeric>
#include <string>
#include <string_view>

int luhn_sum(std::string_view digits) {
    int sum = 0;
    bool dbl = false;
    for (auto it = digits.rbegin(); it != digits.rend(); ++it) {
        int d = *it - '0';
        if (dbl && (d *= 2) > 9) d -= 9;
        sum += d;
        dbl = !dbl;
    }
    return sum;
}

bool luhn_valid(std::string_view input) {
    std::string digits;
    for (char c : input) {
        if (std::isdigit(static_cast<unsigned char>(c))) digits += c;
        else if (c != ' ') return false;
    }
    return digits.size() > 1 && luhn_sum(digits) % 10 == 0;
}

int check_digit(std::string partial) { return (10 - luhn_sum(partial + "0") % 10) % 10; }

int main() {
    std::cout << std::boolalpha << luhn_valid("4539 3195 0343 6467") << ' ' << luhn_valid("8273 1232 7352 0569") << ' '
              << luhn_valid("12a4") << '\n';
    std::cout << "check digit for 7992739871: " << check_digit("7992739871") << '\n';
}
