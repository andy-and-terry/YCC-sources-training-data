#include <iostream>
#include <vector>

class FenwickTree {
public:
    explicit FenwickTree(int size) : size(size), tree(size + 1, 0) {}

    void add(int index, int delta) {
        for (++index; index <= size; index += index & (-index)) tree[index] += delta;
    }

    int prefixSum(int index) const {
        int total = 0;
        for (++index; index > 0; index -= index & (-index)) total += tree[index];
        return total;
    }

    int rangeSum(int left, int right) const {
        return prefixSum(right) - (left > 0 ? prefixSum(left - 1) : 0);
    }

private:
    int size;
    std::vector<int> tree;
};

int main() {
    FenwickTree ft(6);
    std::vector<int> values = {1, 3, 5, 7, 9, 11};
    for (size_t i = 0; i < values.size(); i++) ft.add(static_cast<int>(i), values[i]);
    std::cout << ft.rangeSum(1, 3) << std::endl;
    return 0;
}
