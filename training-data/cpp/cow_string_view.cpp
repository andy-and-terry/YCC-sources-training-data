#include <iostream>
#include <string_view>
#include <vector>

std::vector<std::string_view> splitWords(std::string_view text) {
    std::vector<std::string_view> words;
    size_t start = 0;
    while (start < text.size()) {
        size_t end = text.find(' ', start);
        if (end == std::string_view::npos) end = text.size();
        if (end > start) words.push_back(text.substr(start, end - start));
        start = end + 1;
    }
    return words;
}

int main() {
    std::string sentence = "the quick brown fox";
    for (auto word : splitWords(sentence)) std::cout << word << "|";
    std::cout << std::endl;
    return 0;
}
