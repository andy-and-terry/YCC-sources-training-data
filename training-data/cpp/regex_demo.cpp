#include <iostream>
#include <regex>
#include <string>

int main() {
    // full match
    std::regex email(R"(([\w.]+)@([\w.]+\.[a-z]{2,}))");
    for (const std::string s : {"user@example.com", "bad@address", "a.b@c.org"}) {
        std::cout << s << " -> " << (std::regex_match(s, email) ? "valid" : "invalid") << std::endl;
    }

    // capture groups with regex_search
    std::string log = "2024-05-17 ERROR disk full";
    std::smatch m;
    std::regex pattern(R"((\d{4})-(\d{2})-(\d{2}) (\w+) (.*))");
    if (std::regex_search(log, m, pattern)) {
        std::cout << "year=" << m[1] << " month=" << m[2] << " day=" << m[3] << std::endl;
        std::cout << "level=" << m[4] << " message=" << m[5] << std::endl;
    }

    // iterate over every match
    std::string text = "call 555-1234 or 555-9876 today";
    std::regex phone(R"(\d{3}-\d{4})");
    for (std::sregex_iterator it(text.begin(), text.end(), phone), end; it != end; ++it) {
        std::cout << "found " << it->str() << " at " << it->position() << std::endl;
    }

    // replace with back-references
    std::cout << std::regex_replace("John Smith", std::regex(R"((\w+) (\w+))"), "$2, $1") << std::endl;
    std::cout << std::regex_replace("a  b   c", std::regex(R"(\s+)"), " ") << std::endl;

    // case-insensitive matching
    std::regex word("hello", std::regex::icase);
    std::cout << std::regex_search("Say HeLLo!", word) << std::endl;
    return 0;
}
