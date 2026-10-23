#include <iostream>
#include <unordered_set>
#include <vector>

std::vector<int> ulam(std::size_t count) {
    std::vector<int> terms{1, 2};
    std::unordered_set<int> members{1, 2};
    for (int cand = 3; terms.size() < count; ++cand) {
        int ways = 0;
        for (int a : terms) {
            if (a < cand - a && members.count(cand - a)) ++ways;
        }
        if (ways == 1) {
            terms.push_back(cand);
            members.insert(cand);
        }
    }
    return terms;
}

int main() {
    for (int v : ulam(15)) std::cout << v << ' ';
    std::cout << '\n';
}
