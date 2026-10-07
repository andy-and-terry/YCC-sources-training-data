#include <algorithm>
#include <iostream>
#include <numeric>
#include <string>
#include <vector>

struct Job {
    std::string id;
    int deadline, profit;
};

class Dsu {
public:
    explicit Dsu(int n) : p_(static_cast<std::size_t>(n)) { std::iota(p_.begin(), p_.end(), 0); }
    int find(int x) { return p_[x] == x ? x : p_[x] = find(p_[x]); }
    void link(int x, int y) { p_[x] = y; }

private:
    std::vector<int> p_;
};

int main() {
    std::vector<Job> jobs{{"a", 2, 100}, {"b", 1, 19}, {"c", 2, 27}, {"d", 1, 25}, {"e", 3, 15}};
    std::sort(jobs.begin(), jobs.end(), [](auto& x, auto& y) { return x.profit > y.profit; });
    int max_d = std::max_element(jobs.begin(), jobs.end(), [](auto& x, auto& y) { return x.deadline < y.deadline; })->deadline;
    Dsu dsu(max_d + 1);
    std::vector<std::string> slot(static_cast<std::size_t>(max_d) + 1);
    int profit = 0;
    for (const auto& j : jobs) {
        int free = dsu.find(j.deadline);
        if (free == 0) continue;
        slot[free] = j.id;
        profit += j.profit;
        dsu.link(free, free - 1);
    }
    for (const auto& s : slot)
        if (!s.empty()) std::cout << s << ' ';
    std::cout << "profit=" << profit << '\n';
}
