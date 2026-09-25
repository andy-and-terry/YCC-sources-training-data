#include <cctype>
#include <iostream>
#include <string>
#include <vector>

std::vector<std::string> split_words(const std::string& s) {
    std::vector<std::string> words;
    std::string cur;
    auto flush = [&] {
        if (!cur.empty()) words.push_back(cur), cur.clear();
    };
    for (std::size_t i = 0; i < s.size(); ++i) {
        unsigned char c = static_cast<unsigned char>(s[i]);
        if (c == '_' || c == '-' || c == ' ') {
            flush();
            continue;
        }
        if (std::isupper(c) && i > 0) {
            unsigned char p = static_cast<unsigned char>(s[i - 1]);
            bool next_lower = i + 1 < s.size() && std::islower(static_cast<unsigned char>(s[i + 1]));
            if (std::islower(p) || std::isdigit(p) || (std::isupper(p) && next_lower)) flush();
        }
        cur += static_cast<char>(std::tolower(c));
    }
    flush();
    return words;
}

std::string join(const std::vector<std::string>& w, const std::string& sep, bool camel, bool pascal) {
    std::string out;
    for (std::size_t i = 0; i < w.size(); ++i) {
        std::string part = w[i];
        if (camel && (i > 0 || pascal)) part[0] = static_cast<char>(std::toupper(static_cast<unsigned char>(part[0])));
        out += (i && !camel ? sep : "") + part;
    }
    return out;
}

int main() {
    for (std::string s : {"parseHTTPResponse", "user_id", "background-color", "XMLHttpRequest"}) {
        auto w = split_words(s);
        std::cout << s << " -> " << join(w, "", true, false) << ", " << join(w, "", true, true) << ", " << join(w, "_", false, false)
                  << ", " << join(w, "-", false, false) << '\n';
    }
}
