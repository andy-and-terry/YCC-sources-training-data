#include <iostream>
#include <map>
#include <optional>
#include <string>

std::optional<int> find(const std::map<std::string, int>& m, const std::string& k) {
    auto it = m.find(k);
    if (it == m.end()) return std::nullopt;
    return it->second;
}

int main() {
    std::map<std::string, int> m{{"a", 1}};
    std::cout << find(m, "a").value_or(-1) << ' ' << find(m, "z").value_or(-1) << '\n';
}
