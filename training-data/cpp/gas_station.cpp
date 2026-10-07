#include <iostream>
#include <vector>

int start_station(const std::vector<int>& gas, const std::vector<int>& cost) {
    int total = 0, tank = 0, start = 0;
    for (std::size_t i = 0; i < gas.size(); ++i) {
        int d = gas[i] - cost[i];
        total += d;
        if ((tank += d) < 0) start = static_cast<int>(i) + 1, tank = 0;
    }
    return total < 0 ? -1 : start;
}

int main() { std::cout << start_station({1, 2, 3, 4, 5}, {3, 4, 5, 1, 2}) << ' ' << start_station({2, 3, 4}, {3, 4, 3}) << '\n'; }
