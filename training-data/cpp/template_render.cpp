#include <algorithm>
#include <cctype>
#include <functional>
#include <iostream>
#include <map>
#include <regex>
#include <string>

using Context = std::map<std::string, std::string>;
using Filter = std::function<std::string(std::string)>;

std::string render(const std::string& tpl, const Context& ctx) {
    static const std::map<std::string, Filter> filters = {
        {"upper", [](std::string s) { std::transform(s.begin(), s.end(), s.begin(), ::toupper); return s; }},
        {"lower", [](std::string s) { std::transform(s.begin(), s.end(), s.begin(), ::tolower); return s; }},
        {"len", [](std::string s) { return std::to_string(s.size()); }},
    };
    static const std::regex token(R"(\{\{\s*([\w.]+)\s*(?:\|\s*(\w+)\s*)?\}\})");
    std::string out;
    auto last = tpl.cbegin();
    for (std::sregex_iterator it(tpl.begin(), tpl.end(), token), end; it != end; ++it) {
        const auto& m = *it;
        out.append(last, m[0].first);
        auto found = ctx.find(m[1]);
        std::string value = found == ctx.end() ? "" : found->second;
        if (m[2].matched) value = filters.at(m[2])(value);
        out += value;
        last = m[0].second;
    }
    out.append(last, tpl.cend());
    return out;
}

int main() {
    Context ctx{{"user.name", "Ada"}, {"count", "3"}, {"kind", "messages"}};
    std::cout << render("Hello {{ user.name }}, you have {{count}} new {{ kind | upper }} ({{kind|len}} chars).", ctx) << '\n';
}
