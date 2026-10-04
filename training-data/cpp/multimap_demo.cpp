#include <iostream>
#include <map>
#include <string>

int main() {
    std::multimap<std::string, int> scores;
    scores.insert({"ann", 90});
    scores.insert({"bob", 72});
    scores.insert({"ann", 85});
    scores.insert({"ann", 77});

    std::cout << "ann has " << scores.count("ann") << " scores:";
    auto [first, last] = scores.equal_range("ann");
    for (auto it = first; it != last; ++it) std::cout << " " << it->second;
    std::cout << "\n";

    scores.erase("bob");
    for (const auto& [name, score] : scores) {
        std::cout << name << " -> " << score << "\n";
    }

    std::map<std::string, int> single{{"x", 1}};
    single.insert({"x", 2});           // ignored, key exists
    single.insert_or_assign("x", 3);   // overwrites
    single.try_emplace("y", 4);
    std::cout << single["x"] << " " << single["y"] << "\n";
    return 0;
}
