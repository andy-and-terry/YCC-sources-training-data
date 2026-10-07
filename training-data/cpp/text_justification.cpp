#include <iostream>
#include <sstream>
#include <string>
#include <vector>

std::vector<std::string> justify(const std::vector<std::string>& words, std::size_t width) {
    std::vector<std::string> lines;
    for (std::size_t i = 0; i < words.size();) {
        std::size_t j = i, len = 0;
        while (j < words.size() && len + words[j].size() + (j - i) <= width) len += words[j++].size();
        std::size_t gaps = j - i - 1;
        std::string line;
        if (j == words.size() || gaps == 0) {
            for (std::size_t k = i; k < j; ++k) line += (k > i ? " " : "") + words[k];
            line.resize(width, ' ');
        } else {
            std::size_t spaces = (width - len) / gaps, extra = (width - len) % gaps;
            for (std::size_t k = i; k < j - 1; ++k) line += words[k] + std::string(spaces + (k - i < extra), ' ');
            line += words[j - 1];
        }
        lines.push_back(line);
        i = j;
    }
    return lines;
}

int main() {
    std::istringstream in("This is an example of text justification done greedily line by line");
    std::vector<std::string> words;
    for (std::string w; in >> w;) words.push_back(w);
    for (const auto& l : justify(words, 20)) std::cout << '[' << l << "]\n";
}
