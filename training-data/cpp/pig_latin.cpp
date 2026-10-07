#include <iostream>
#include <sstream>
#include <string>

bool vowel(char c) { return std::string("aeiou").find(c) != std::string::npos; }

std::string word(const std::string& w) {
    if (vowel(w[0]) || w.rfind("xr", 0) == 0 || w.rfind("yt", 0) == 0) return w + "ay";
    for (size_t i = 1; i < w.size(); ++i) {
        if (w[i] == 'u' && w[i - 1] == 'q') return w.substr(i + 1) + w.substr(0, i + 1) + "ay";
        if (vowel(w[i]) || w[i] == 'y') return w.substr(i) + w.substr(0, i) + "ay";
    }
    return w + "ay";
}

int main() {
    std::istringstream in("quick fast run apple rhythm square");
    std::string w, sep;
    while (in >> w) { std::cout << sep << word(w); sep = " "; }
    std::cout << '\n';
}
