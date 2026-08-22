#include <iostream>
#include <string>

std::string encrypt(const std::string& text, int shift) {
    std::string result;
    for (char ch : text) {
        if (isalpha(static_cast<unsigned char>(ch))) {
            char base = isupper(static_cast<unsigned char>(ch)) ? 'A' : 'a';
            result += static_cast<char>((ch - base + shift % 26 + 26) % 26 + base);
        } else {
            result += ch;
        }
    }
    return result;
}

std::string decrypt(const std::string& text, int shift) {
    return encrypt(text, -shift);
}

int main() {
    std::string cipher = encrypt("Hello, World!", 3);
    std::cout << cipher << std::endl;
    std::cout << decrypt(cipher, 3) << std::endl;
    return 0;
}
