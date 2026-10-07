#include <iostream>
#include <vector>

void combine(int n, int k, int start, std::vector<int>& current,
             std::vector<std::vector<int>>& result) {
    if (static_cast<int>(current.size()) == k) {
        result.push_back(current);
        return;
    }
    for (int i = start; i <= n; i++) {
        current.push_back(i);
        combine(n, k, i + 1, current, result);
        current.pop_back();
    }
}

int main() {
    std::vector<int> current;
    std::vector<std::vector<int>> result;
    combine(4, 2, 1, current, result);

    for (const auto& combo : result) {
        for (int v : combo) std::cout << v << " ";
        std::cout << std::endl;
    }
    return 0;
}
