#include <iostream>
#include <string>

int modInverse(int a, int m) {
    for (int x = 1; x < m; ++x)
        if (a * x % m == 1) return x;
    return 0;
}

std::string affine(std::string s, int a, int b, bool decrypt = false) {
    int inv = modInverse(a, 26);
    for (char& ch : s) {
        if (ch >= 'A' && ch <= 'Z') {
            int x = ch - 'A';
            int y = decrypt ? ((inv * (x - b)) % 26 + 26) % 26 : (a * x + b) % 26;
            ch = 'A' + y;
        }
    }
    return s;
}

int main() {
    auto c = affine("AFFINE", 5, 8);
    std::cout << c << " " << affine(c, 5, 8, true) << "\n";
}
