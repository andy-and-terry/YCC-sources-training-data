#include <iostream>
#include <string>

std::string replace_all(std::string s, const std::string& from, const std::string& to) {
    for (std::size_t pos = 0; (pos = s.find(from, pos)) != std::string::npos; pos += to.size())
        s.replace(pos, from.size(), to);
    return s;
}

int main() {
    std::string s = "the cat sat on the mat with the hat";
    std::cout << s.find("the") << " " << s.rfind("the") << " " << s.find("dog") << "\n";
    std::cout << replace_all(s, "the", "a") << "\n";
    std::cout << s.find_first_of("aeiou") << " " << s.find_first_not_of("the ") << " " << s.find_last_of('t') << "\n";
    s.insert(0, ">> ").append(" <<");
    std::cout << s << "\n";
    s.erase(0, 3);
    std::cout << s.substr(0, 7) << "|" << s.compare("the") << "\n";
}
