#include <iostream>
#include <regex>
#include <string>

int main() {
    std::string text = "Contact: alice@example.com, bob@test.org";
    std::regex email(R"(([\w.]+)@([\w.]+\.\w+))");

    for (std::sregex_iterator it(text.begin(), text.end(), email), end; it != end; ++it)
        std::cout << "user=" << (*it)[1] << " domain=" << (*it)[2] << "\n";

    std::cout << std::regex_replace("2024-03-15", std::regex(R"((\d+)-(\d+)-(\d+))"), "$3/$2/$1") << "\n";
    std::cout << std::boolalpha << std::regex_match("abc123", std::regex("[a-z]+\\d+")) << "\n";
}
