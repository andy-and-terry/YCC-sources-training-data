#include <iostream>
#include <vector>

class SegmentTree {
public:
    explicit SegmentTree(const std::vector<int>& data) : n(data.size()), tree(2 * data.size()) {
        for (size_t i = 0; i < n; i++) tree[n + i] = data[i];
        for (int i = static_cast<int>(n) - 1; i > 0; i--) tree[i] = tree[2 * i] + tree[2 * i + 1];
    }

    void update(size_t index, int value) {
        size_t i = index + n;
        tree[i] = value;
        while (i > 1) {
            i /= 2;
            tree[i] = tree[2 * i] + tree[2 * i + 1];
        }
    }

    int query(size_t left, size_t right) {
        left += n;
        right += n;
        int total = 0;
        while (left < right) {
            if (left % 2 == 1) total += tree[left++];
            if (right % 2 == 1) total += tree[--right];
            left /= 2;
            right /= 2;
        }
        return total;
    }

private:
    size_t n;
    std::vector<int> tree;
};

int main() {
    SegmentTree tree({1, 3, 5, 7, 9, 11});
    std::cout << tree.query(1, 4) << std::endl;
    tree.update(1, 10);
    std::cout << tree.query(1, 4) << std::endl;
    return 0;
}
