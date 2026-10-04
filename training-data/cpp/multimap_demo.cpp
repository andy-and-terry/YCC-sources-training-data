#include <iostream>
#include <map>
#include <set>
#include <string>

int main() {
    std::multimap<std::string, std::string> courses;
    courses.emplace("alice", "math");
    courses.emplace("bob", "art");
    courses.emplace("alice", "physics");
    courses.emplace("alice", "chess");
    courses.emplace("bob", "music");

    std::cout << "total entries: " << courses.size() << std::endl;
    std::cout << "alice count:   " << courses.count("alice") << std::endl;

    auto range = courses.equal_range("alice");
    for (auto it = range.first; it != range.second; ++it) {
        std::cout << "alice -> " << it->second << std::endl;
    }

    // erase a single entry, not all with that key
    for (auto it = courses.find("alice"); it != courses.end(); ++it) {
        if (it->second == "physics") {
            courses.erase(it);
            break;
        }
    }

    for (const auto& [name, course] : courses) {
        std::cout << name << ": " << course << std::endl;
    }

    // multiset with a custom ordering
    std::multiset<int, std::greater<int>> scores{70, 90, 70, 85, 90, 90};
    for (int s : scores) std::cout << s << ' ';
    std::cout << "| 90 appears " << scores.count(90) << " times" << std::endl;
    return 0;
}
