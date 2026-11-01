#include <iostream>
#include <optional>
#include <string>

std::optional<int> to_int(const std::string& s) {
    try { return std::stoi(s); } catch (...) { return std::nullopt; }
}

int main() {
    for (auto s : {"12", "zz"}) {
        auto v = to_int(s);
        std::cout << v.value_or(-1) << "\n";
    }
}
