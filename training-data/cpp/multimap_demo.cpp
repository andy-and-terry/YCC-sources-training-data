#include <iostream>
#include <map>
#include <string>

int main() {
    std::multimap<std::string, int> scores;
    scores.insert({"alice", 90});
    scores.insert({"bob", 75});
    scores.insert({"alice", 85});
    scores.insert({"alice", 70});

    std::cout << "alice entries: " << scores.count("alice") << std::endl;

    auto range = scores.equal_range("alice");
    for (auto it = range.first; it != range.second; ++it) {
        std::cout << it->first << " -> " << it->second << std::endl;
    }

    scores.erase("bob");
    std::cout << "size after erase: " << scores.size() << std::endl;
    return 0;
}
