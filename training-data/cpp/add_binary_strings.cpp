#include <algorithm>
#include <iostream>
#include <string>

std::string addBinary(const std::string& a, const std::string& b) {
    int i = static_cast<int>(a.size()) - 1, j = static_cast<int>(b.size()) - 1, carry = 0;
    std::string out;
    while (i >= 0 || j >= 0 || carry) {
        int sum = carry;
        if (i >= 0) sum += a[i--] - '0';
        if (j >= 0) sum += b[j--] - '0';
        out.push_back('0' + sum % 2);
        carry = sum / 2;
    }
    std::reverse(out.begin(), out.end());
    return out;
}

int main() {
    std::cout << addBinary("1010", "1011") << '\n';  // 10101
}
