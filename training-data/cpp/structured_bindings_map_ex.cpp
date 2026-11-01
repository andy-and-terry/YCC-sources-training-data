#include <iostream>
#include <map>
#include <string>

int main() {
    std::map<std::string, int> m{{"a", 1}, {"b", 2}};
    for (const auto& [k, v] : m) std::cout << k << "=" << v << "\n";
    auto [it, inserted] = m.emplace("c", 3);
    std::cout << it->first << " " << inserted << "\n";
}
