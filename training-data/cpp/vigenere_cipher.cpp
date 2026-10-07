#include <cctype>
#include <iostream>
#include <stdexcept>
#include <string>

class Vigenere {
public:
    explicit Vigenere(const std::string& key) {
        for (char c : key)
            if (std::isalpha(static_cast<unsigned char>(c))) shifts_ += static_cast<char>(std::tolower(static_cast<unsigned char>(c)) - 'a');
        if (shifts_.empty()) throw std::invalid_argument("key needs letters");
    }

    std::string encrypt(std::string s) const { return apply(std::move(s), 1); }
    std::string decrypt(std::string s) const { return apply(std::move(s), -1); }

private:
    std::string apply(std::string s, int dir) const {
        std::size_t k = 0;
        for (char& c : s) {
            if (!std::isalpha(static_cast<unsigned char>(c))) continue;
            char base = std::isupper(static_cast<unsigned char>(c)) ? 'A' : 'a';
            int shifted = (c - base + dir * shifts_[k++ % shifts_.size()]) % 26;
            c = static_cast<char>(base + (shifted + 26) % 26);
        }
        return s;
    }

    std::string shifts_;
};

int main() {
    Vigenere v("LEMON");
    auto c = v.encrypt("Attack at dawn!");
    std::cout << c << " -> " << v.decrypt(c) << '\n';
}
