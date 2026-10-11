#include <iostream>
#include <map>
#include <mutex>
#include <string>

int main() {
    std::map<std::string, int> stock{{"apple", 3}, {"pear", 0}};

    if (auto it = stock.find("apple"); it != stock.end())
        std::cout << "apple: " << it->second << "\n";
    else
        std::cout << "no apples\n";

    if (auto [it, inserted] = stock.try_emplace("fig", 12); inserted)
        std::cout << "inserted fig=" << it->second << "\n";

    std::mutex m;
    if (std::lock_guard lk(m); !stock.empty())
        std::cout << "locked, size=" << stock.size() << "\n";

    switch (int n = stock["pear"]; n) {
        case 0: std::cout << "out of pears\n"; break;
        default: std::cout << n << " pears\n";
    }
}
