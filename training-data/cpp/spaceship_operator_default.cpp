#include <compare>
#include <iostream>
#include <set>

struct Ver {
    int major, minor;
    auto operator<=>(const Ver&) const = default;
};

int main() {
    std::set<Ver> s{{1, 2}, {0, 9}, {1, 0}};
    for (auto& v : s) std::cout << v.major << "." << v.minor << " ";
    std::cout << (Ver{1, 0} < Ver{1, 1}) << (Ver{2, 0} == Ver{2, 0}) << "\n";
}
