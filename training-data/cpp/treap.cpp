#include <iostream>
#include <memory>
#include <random>

struct TreapNode {
    int key;
    int priority;
    std::unique_ptr<TreapNode> left;
    std::unique_ptr<TreapNode> right;
    explicit TreapNode(int key, int priority) : key(key), priority(priority) {}
};

class Treap {
public:
    void insert(int key) {
        root = insert(std::move(root), key);
    }

    bool contains(int key) const {
        TreapNode* node = root.get();
        while (node != nullptr) {
            if (key == node->key) return true;
            node = key < node->key ? node->left.get() : node->right.get();
        }
        return false;
    }

    void inorder() const {
        inorder(root.get());
        std::cout << std::endl;
    }

private:
    std::unique_ptr<TreapNode> root;
    std::mt19937 rng{42};

    std::unique_ptr<TreapNode> rotateRight(std::unique_ptr<TreapNode> node) {
        std::unique_ptr<TreapNode> newRoot = std::move(node->left);
        node->left = std::move(newRoot->right);
        newRoot->right = std::move(node);
        return newRoot;
    }

    std::unique_ptr<TreapNode> rotateLeft(std::unique_ptr<TreapNode> node) {
        std::unique_ptr<TreapNode> newRoot = std::move(node->right);
        node->right = std::move(newRoot->left);
        newRoot->left = std::move(node);
        return newRoot;
    }

    std::unique_ptr<TreapNode> insert(std::unique_ptr<TreapNode> node, int key) {
        if (!node) return std::make_unique<TreapNode>(key, static_cast<int>(rng()) % 1000);

        if (key < node->key) {
            node->left = insert(std::move(node->left), key);
            if (node->left->priority > node->priority) node = rotateRight(std::move(node));
        } else if (key > node->key) {
            node->right = insert(std::move(node->right), key);
            if (node->right->priority > node->priority) node = rotateLeft(std::move(node));
        }
        return node;
    }

    void inorder(const TreapNode* node) const {
        if (!node) return;
        inorder(node->left.get());
        std::cout << node->key << " ";
        inorder(node->right.get());
    }
};

int main() {
    Treap treap;
    for (int key : {5, 2, 8, 1, 9, 3, 7}) treap.insert(key);

    treap.inorder();
    std::cout << "contains 8: " << treap.contains(8) << std::endl;
    std::cout << "contains 4: " << treap.contains(4) << std::endl;
    return 0;
}
