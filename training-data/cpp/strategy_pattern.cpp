#include <algorithm>
#include <functional>
#include <iostream>
#include <vector>

class SortContext {
public:
    explicit SortContext(std::function<std::vector<int>(std::vector<int>)> strategy) : strategy(std::move(strategy)) {}
    std::vector<int> sort(std::vector<int> items) { return strategy(std::move(items)); }
    void setStrategy(std::function<std::vector<int>(std::vector<int>)> s) { strategy = std::move(s); }

private:
    std::function<std::vector<int>(std::vector<int>)> strategy;
};

std::vector<int> ascending(std::vector<int> items) {
    std::sort(items.begin(), items.end());
    return items;
}

std::vector<int> descending(std::vector<int> items) {
    auto sorted = ascending(std::move(items));
    std::reverse(sorted.begin(), sorted.end());
    return sorted;
}

int main() {
    SortContext ctx(ascending);
    for (int x : ctx.sort({5, 3, 8, 1})) std::cout << x << " ";
    std::cout << std::endl;
    ctx.setStrategy(descending);
    for (int x : ctx.sort({5, 3, 8, 1})) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
