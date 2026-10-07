#include <algorithm>
#include <iostream>
#include <memory>
#include <vector>

// House robber on a binary tree: each node returns {best if robbed, best if skipped}.
struct Node {
    int val;
    std::unique_ptr<Node> left, right;
};

std::pair<int, int> rob(const Node* n) {
    if (!n) return {0, 0};
    auto [lr, ls] = rob(n->left.get());
    auto [rr, rs] = rob(n->right.get());
    return {n->val + ls + rs, std::max(lr, ls) + std::max(rr, rs)};
}

int rob_line(const std::vector<int>& h) {
    int take = 0, skip = 0;
    for (int x : h) {
        int t = skip + x;
        skip = std::max(take, skip);
        take = t;
    }
    return std::max(take, skip);
}

std::unique_ptr<Node> make(int v, std::unique_ptr<Node> l = nullptr, std::unique_ptr<Node> r = nullptr) {
    return std::unique_ptr<Node>(new Node{v, std::move(l), std::move(r)});
}

int main() {
    std::cout << rob_line({2, 7, 9, 3, 1}) << '\n';
    // tree: 3 -> (4 -> (1, 3), 5 -> (-, 1)); best is 4 + 5 = 9
    auto root = make(3, make(4, make(1), make(3)), make(5, nullptr, make(1)));
    auto [a, b] = rob(root.get());
    std::cout << std::max(a, b) << '\n';
}
