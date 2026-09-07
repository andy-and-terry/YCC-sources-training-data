#include <algorithm>
#include <iostream>
#include <memory>

struct Node {
    int value;
    int height = 1;
    std::unique_ptr<Node> left;
    std::unique_ptr<Node> right;
    explicit Node(int v) : value(v) {}
};

int height(const std::unique_ptr<Node>& node) { return node ? node->height : 0; }
int balanceFactor(const std::unique_ptr<Node>& node) { return node ? height(node->left) - height(node->right) : 0; }
void updateHeight(std::unique_ptr<Node>& node) { node->height = 1 + std::max(height(node->left), height(node->right)); }

std::unique_ptr<Node> rotateRight(std::unique_ptr<Node> y) {
    std::unique_ptr<Node> x = std::move(y->left);
    y->left = std::move(x->right);
    updateHeight(y);
    x->right = std::move(y);
    updateHeight(x);
    return x;
}

std::unique_ptr<Node> rotateLeft(std::unique_ptr<Node> x) {
    std::unique_ptr<Node> y = std::move(x->right);
    x->right = std::move(y->left);
    updateHeight(x);
    y->left = std::move(x);
    updateHeight(y);
    return y;
}

std::unique_ptr<Node> insert(std::unique_ptr<Node> node, int value) {
    if (!node) return std::make_unique<Node>(value);
    if (value < node->value) node->left = insert(std::move(node->left), value);
    else if (value > node->value) node->right = insert(std::move(node->right), value);
    else return node;

    updateHeight(node);
    int balance = balanceFactor(node);

    if (balance > 1 && value < node->left->value) return rotateRight(std::move(node));
    if (balance < -1 && value > node->right->value) return rotateLeft(std::move(node));
    if (balance > 1 && value > node->left->value) {
        node->left = rotateLeft(std::move(node->left));
        return rotateRight(std::move(node));
    }
    if (balance < -1 && value < node->right->value) {
        node->right = rotateRight(std::move(node->right));
        return rotateLeft(std::move(node));
    }
    return node;
}

void inorder(const std::unique_ptr<Node>& node) {
    if (!node) return;
    inorder(node->left);
    std::cout << node->value << " ";
    inorder(node->right);
}

int main() {
    std::unique_ptr<Node> root;
    for (int v : {10, 20, 30, 40, 50, 25}) root = insert(std::move(root), v);
    inorder(root);
    std::cout << std::endl;
    std::cout << "height: " << height(root) << std::endl;
    return 0;
}
