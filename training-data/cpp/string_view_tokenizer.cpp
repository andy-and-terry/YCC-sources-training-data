#include <iostream>
#include <string_view>
#include <vector>

std::vector<std::string_view> tokenize(std::string_view text, std::string_view delims) {
    std::vector<std::string_view> tokens;
    while (!text.empty()) {
        auto start = text.find_first_not_of(delims);
        if (start == std::string_view::npos) break;
        text.remove_prefix(start);
        auto end = text.find_first_of(delims);
        tokens.push_back(text.substr(0, end));
        if (end == std::string_view::npos) break;
        text.remove_prefix(end);
    }
    return tokens;
}

int main() {
    for (auto tok : tokenize("  the quick, brown;fox  ", " ,;")) {
        std::cout << "<" << tok << ">" << std::endl;
    }
    return 0;
}
