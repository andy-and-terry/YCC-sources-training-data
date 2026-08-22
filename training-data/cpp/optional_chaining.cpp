#include <iostream>
#include <optional>
#include <string>
#include <unordered_map>

std::optional<std::string> findUser(const std::unordered_map<int, std::string>& users, int id) {
    auto it = users.find(id);
    if (it == users.end()) return std::nullopt;
    return it->second;
}

int main() {
    std::unordered_map<int, std::string> users = {{1, "Alice"}};

    if (auto name = findUser(users, 1)) {
        std::cout << "found: " << *name << std::endl;
    }

    std::string result = findUser(users, 999).value_or("UNKNOWN");
    std::cout << result << std::endl;
    return 0;
}
