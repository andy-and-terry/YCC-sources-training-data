#include <iostream>
#include <unordered_map>
#include <vector>

std::vector<int> vanEck(int count) {
    std::vector<int> seq{0};
    std::unordered_map<int, int> lastSeen;
    for (int i = 0; i < count - 1; ++i) {
        int cur = seq[i];
        auto it = lastSeen.find(cur);
        int next = it != lastSeen.end() ? i - it->second : 0;
        lastSeen[cur] = i;
        seq.push_back(next);
    }
    return seq;
}

int main() {
    for (int v : vanEck(20)) std::cout << v << ' ';
    std::cout << '\n';
}
