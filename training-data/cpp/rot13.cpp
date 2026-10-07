#include <algorithm>
#include <iostream>
#include <iterator>
#include <string>

char rot13(char c) {
    if (c >= 'a' && c <= 'z') return static_cast<char>('a' + (c - 'a' + 13) % 26);
    if (c >= 'A' && c <= 'Z') return static_cast<char>('A' + (c - 'A' + 13) % 26);
    return c;
}

int main(int argc, char** argv) {
    if (argc > 1 && std::string(argv[1]) == "-") {
        std::transform(std::istreambuf_iterator<char>(std::cin), {}, std::ostreambuf_iterator<char>(std::cout), rot13);
        return 0;
    }
    std::string s = "Why did the chicken cross the road?";
    std::transform(s.begin(), s.end(), s.begin(), rot13);
    std::cout << s << '\n';
}
