#include <algorithm>
#include <iostream>
#include <queue>
#include <vector>

// Jump Game III: from index i you may jump to i + a[i] or i - a[i]; can we reach any zero?
bool can_reach_zero(const std::vector<int>& a, int start) {
    std::vector<bool> seen(a.size());
    std::queue<int> q;
    q.push(start);
    while (!q.empty()) {
        int i = q.front();
        q.pop();
        if (i < 0 || i >= static_cast<int>(a.size()) || seen[i]) continue;
        if (a[i] == 0) return true;
        seen[i] = true;
        q.push(i + a[i]);
        q.push(i - a[i]);
    }
    return false;
}

bool can_jump(const std::vector<int>& a) {
    int reach = 0;
    for (int i = 0; i < static_cast<int>(a.size()) && i <= reach; ++i) reach = std::max(reach, i + a[i]);
    return reach >= static_cast<int>(a.size()) - 1;
}

int main() {
    std::cout << std::boolalpha << can_jump({2, 3, 1, 1, 4}) << ' ' << can_jump({3, 2, 1, 0, 4}) << '\n';
    std::cout << can_reach_zero({4, 2, 3, 0, 3, 1, 2}, 5) << ' ' << can_reach_zero({3, 0, 2, 1, 2}, 2) << '\n';
}
