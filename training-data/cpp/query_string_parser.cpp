#include <cctype>
#include <iomanip>
#include <iostream>
#include <map>
#include <sstream>
#include <string>
#include <vector>

using Query = std::multimap<std::string, std::string>;

std::string decode(const std::string& s) {
    std::string out;
    for (std::size_t i = 0; i < s.size(); ++i) {
        if (s[i] == '+') out += ' ';
        else if (s[i] == '%' && i + 2 < s.size() + 1 && std::isxdigit(static_cast<unsigned char>(s[i + 1])) &&
                 std::isxdigit(static_cast<unsigned char>(s[i + 2]))) {
            out += static_cast<char>(std::stoi(s.substr(i + 1, 2), nullptr, 16));
            i += 2;
        } else out += s[i];
    }
    return out;
}

std::string encode(const std::string& s) {
    std::ostringstream os;
    for (unsigned char c : s) {
        if (std::isalnum(c) || c == '-' || c == '_' || c == '.' || c == '~') os << c;
        else os << '%' << std::uppercase << std::hex << std::setw(2) << std::setfill('0') << int{c};
    }
    return os.str();
}

Query parse(const std::string& qs) {
    Query q;
    std::istringstream in(qs[0] == '?' ? qs.substr(1) : qs);
    for (std::string pair; std::getline(in, pair, '&');) {
        if (pair.empty()) continue;
        auto eq = pair.find('=');
        q.emplace(decode(pair.substr(0, eq)), eq == std::string::npos ? "" : decode(pair.substr(eq + 1)));
    }
    return q;
}

int main() {
    auto q = parse("?name=J%C3%BCrgen+M&tag=a&tag=b&empty=");
    std::string rebuilt;
    for (const auto& [k, v] : q) {
        std::cout << k << " = \"" << v << "\"\n";
        rebuilt += (rebuilt.empty() ? "" : "&") + encode(k) + "=" + encode(v);
    }
    std::cout << rebuilt << '\n';
}
