#include <cctype>
#include <iostream>
#include <map>
#include <sstream>
#include <string>

const std::map<char, std::string> MORSE = {
    {'A', ".-"}, {'B', "-..."}, {'C', "-.-."}, {'D', "-.."}, {'E', "."}, {'F', "..-."}, {'G', "--."},
    {'H', "...."}, {'I', ".."}, {'J', ".---"}, {'K', "-.-"}, {'L', ".-.."}, {'M', "--"}, {'N', "-."},
    {'O', "---"}, {'P', ".--."}, {'Q', "--.-"}, {'R', ".-."}, {'S', "..."}, {'T', "-"}, {'U', "..-"},
    {'V', "...-"}, {'W', ".--"}, {'X', "-..-"}, {'Y', "-.--"}, {'Z', "--.."}, {'0', "-----"},
    {'1', ".----"}, {'2', "..---"}, {'3', "...--"}, {'4', "....-"}, {'5', "....."}, {'6', "-...."},
    {'7', "--..."}, {'8', "---.."}, {'9', "----."},
};

std::string encode(const std::string& text) {
    std::istringstream in(text);
    std::string word, out;
    while (in >> word) {
        if (!out.empty()) out += " / ";
        bool first = true;
        for (char c : word) {
            auto it = MORSE.find(static_cast<char>(std::toupper(static_cast<unsigned char>(c))));
            if (it == MORSE.end()) continue;
            if (!first) out += ' ';
            out += it->second;
            first = false;
        }
    }
    return out;
}

std::string decode(const std::string& code) {
    std::map<std::string, char> rev;
    for (const auto& [k, v] : MORSE) rev[v] = k;
    std::istringstream in(code);
    std::string sym, out;
    while (in >> sym) out += sym == "/" ? ' ' : (rev.count(sym) ? rev[sym] : '?');
    return out;
}

int main() {
    auto m = encode("SOS help 2024");
    std::cout << m << '\n' << decode(m) << '\n';
}
