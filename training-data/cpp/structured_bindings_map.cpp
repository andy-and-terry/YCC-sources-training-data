#include <iostream>
#include <map>
#include <string>
#include <tuple>

std::tuple<int, int> divmod(int a, int b) { return {a / b, a % b}; }

int main() {
    std::map<std::string, int> ages{{"ann", 31}, {"bob", 27}};
    for (const auto& [name, age] : ages) std::cout << name << '=' << age << '\n';
    auto [q, r] = divmod(17, 5);
    std::cout << q << ' ' << r << '\n';
}
