#include <cctype>
#include <iostream>
#include <optional>
#include <string>
#include <string_view>
#include <variant>

struct Isbn10 { std::string digits; };
struct Isbn13 { std::string digits; };
struct Invalid { std::string reason; };
using Result = std::variant<Isbn10, Isbn13, Invalid>;

Result parse_isbn(std::string_view raw) {
    std::string s;
    for (char c : raw)
        if (c != '-' && c != ' ') s += static_cast<char>(std::toupper(static_cast<unsigned char>(c)));
    if (s.size() == 10) {
        int total = 0;
        for (int i = 0; i < 10; ++i) {
            int v = std::isdigit(static_cast<unsigned char>(s[i])) ? s[i] - '0' : (i == 9 && s[i] == 'X') ? 10 : -1;
            if (v < 0) return Invalid{"bad character"};
            total += (10 - i) * v;
        }
        return total % 11 == 0 ? Result{Isbn10{s}} : Result{Invalid{"checksum"}};
    }
    if (s.size() == 13) {
        int total = 0;
        for (int i = 0; i < 13; ++i) {
            if (!std::isdigit(static_cast<unsigned char>(s[i]))) return Invalid{"bad character"};
            total += (s[i] - '0') * (i % 2 ? 3 : 1);
        }
        return total % 10 == 0 ? Result{Isbn13{s}} : Result{Invalid{"checksum"}};
    }
    return Invalid{"length " + std::to_string(s.size())};
}

template <class... Ts> struct overloaded : Ts... { using Ts::operator()...; };

int main() {
    for (auto s : {"0-306-40615-2", "0-306-40615-3", "978-0-306-40615-7", "0-8044-2957-X", "12345"}) {
        std::visit(overloaded{
                       [&](const Isbn10& i) { std::cout << s << ": ISBN-10 " << i.digits << '\n'; },
                       [&](const Isbn13& i) { std::cout << s << ": ISBN-13 " << i.digits << '\n'; },
                       [&](const Invalid& e) { std::cout << s << ": invalid (" << e.reason << ")\n"; },
                   },
                   parse_isbn(s));
    }
}
