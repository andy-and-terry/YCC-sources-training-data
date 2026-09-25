#include <iostream>
#include <regex>
#include <sstream>
#include <string>

std::string pig_word(const std::string& w) {
    static const std::regex re("^(qu|[^aeiouAEIOU]*)(.*)$");
    std::smatch m;
    std::regex_match(w, m, re);
    if (m[1].length() == 0) return w + "way";
    if (m[2].length() == 0) return w + "ay";
    return m[2].str() + m[1].str() + "ay";
}

int main() {
    std::istringstream in("the quick brown fox jumps over the lazy dog");
    std::string word;
    while (in >> word) std::cout << pig_word(word) << ' ';
    std::cout << '\n';
}
