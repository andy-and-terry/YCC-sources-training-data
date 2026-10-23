#include <iostream>
#include <map>
#include <string>

int main() {
    std::map<std::string, int> stock{{"apple", 3}, {"pear", 5}};

    // insert_or_assign overwrites existing values (insert would not)
    auto [it1, inserted1] = stock.insert_or_assign("apple", 10);
    auto [it2, inserted2] = stock.insert_or_assign("fig", 7);
    std::cout << it1->first << " inserted=" << inserted1 << "\n";
    std::cout << it2->first << " inserted=" << inserted2 << "\n";

    // extract moves a node out without copying, allowing key changes
    auto node = stock.extract("pear");
    node.key() = "plum";
    stock.insert(std::move(node));

    for (const auto& [k, v] : stock)
        std::cout << k << "=" << v << "\n";
    return 0;
}
