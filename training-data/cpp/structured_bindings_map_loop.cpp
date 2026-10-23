#include <iostream>
#include <map>
#include <string>
#include <tuple>

std::tuple<int, std::string> lookup() { return {7, "seven"}; }

int main() {
    std::map<std::string, int> ages{{"alice", 30}, {"bob", 25}};
    for (const auto &[name, age] : ages) std::cout << name << " -> " << age << "\n";
    auto [n, word] = lookup();
    std::cout << n << " " << word << "\n";
}
