#include <initializer_list>
#include <iostream>
#include <vector>

class Bag {
    std::vector<int> items_;
public:
    Bag(std::initializer_list<int> init) : items_(init) {}
    int sum() const { int s = 0; for (int v : items_) s += v; return s; }
    std::size_t size() const { return items_.size(); }
};

int maxOf(std::initializer_list<int> xs) {
    int m = *xs.begin();
    for (int x : xs) if (x > m) m = x;
    return m;
}

int main() {
    Bag b{1, 2, 3, 4, 5};
    std::cout << b.size() << " items, sum " << b.sum() << "\n";
    std::cout << maxOf({3, 9, 2, 7}) << "\n";
}
