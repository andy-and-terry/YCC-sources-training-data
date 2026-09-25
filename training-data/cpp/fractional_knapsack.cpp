#include <algorithm>
#include <iomanip>
#include <iostream>
#include <string>
#include <vector>

struct Item {
    std::string name;
    double value, weight;
};

double fractional_knapsack(std::vector<Item> items, double capacity) {
    std::sort(items.begin(), items.end(), [](const Item& a, const Item& b) { return a.value / a.weight > b.value / b.weight; });
    double total = 0;
    for (const auto& it : items) {
        if (capacity <= 0) break;
        double take = std::min(it.weight, capacity);
        total += it.value * take / it.weight;
        capacity -= take;
        std::cout << "take " << std::fixed << std::setprecision(1) << take << " of " << it.name << '\n';
    }
    return total;
}

int main() {
    double total = fractional_knapsack({{"gold", 60, 10}, {"silver", 100, 20}, {"bronze", 120, 30}}, 50);
    std::cout << "total " << total << '\n';
}
