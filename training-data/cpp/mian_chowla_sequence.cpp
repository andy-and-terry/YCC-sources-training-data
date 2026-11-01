#include <iostream>
#include <set>
#include <vector>

// Greedy sequence whose pairwise sums are all distinct.
int main() {
    std::vector<int> seq;
    std::set<int> sums;
    for (int cand = 1; seq.size() < 8; ++cand) {
        std::set<int> fresh;
        bool ok = true;
        auto tryAdd = [&](int x) {
            int s = x + cand;
            if (sums.count(s) || !fresh.insert(s).second) ok = false;
        };
        for (int x : seq) tryAdd(x);
        tryAdd(cand);
        if (ok) {
            seq.push_back(cand);
            sums.insert(fresh.begin(), fresh.end());
        }
    }
    for (int v : seq) std::cout << v << ' ';
    std::cout << '\n';
}
