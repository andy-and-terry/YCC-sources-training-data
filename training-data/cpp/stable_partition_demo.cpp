#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

int main() {
    std::vector<std::string> words{"apple", "kiwi", "banana", "fig", "cherry", "plum"};
    auto mid = std::stable_partition(words.begin(), words.end(),
                                     [](const std::string& w) { return w.size() > 4; });
    for (auto it = words.begin(); it != words.end(); ++it) {
        if (it == mid) std::cout << "| ";
        std::cout << *it << ' ';
    }
    std::cout << "\n";

    std::vector<int> v{1, 2, 3, 4, 5, 6, 7, 8};
    auto pp = std::partition_point(v.begin(), v.end(), [](int x) { return x < 5; });
    std::cout << "partition point at index " << pp - v.begin() << "\n";
    std::cout << std::is_partitioned(v.begin(), v.end(), [](int x) { return x < 5; }) << "\n";
}
