#include <iostream>
#include <optional>
#include <string>
#include <vector>

std::optional<int> find_index(const std::vector<std::string>& v, const std::string& key) {
    for (std::size_t i = 0; i < v.size(); ++i)
        if (v[i] == key) return static_cast<int>(i);
    return std::nullopt;
}

int main() {
    std::vector<std::string> names{"ann", "bob", "cy"};
    if (auto i = find_index(names, "bob")) std::cout << "bob at " << *i << "\n";
    auto missing = find_index(names, "zed");
    std::cout << "has value: " << missing.has_value() << ", value_or: " << missing.value_or(-1) << "\n";
    try { missing.value(); } catch (const std::bad_optional_access&) { std::cout << "bad_optional_access\n"; }

    std::optional<std::string> o;
    o.emplace(5, 'x');
    std::cout << *o << "\n";
    o.reset();
    std::cout << o.has_value() << "\n";
}
