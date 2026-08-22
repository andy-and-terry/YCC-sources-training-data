#include <iostream>
#include <memory>
#include <vector>

struct Node {
    int value;
    std::unique_ptr<Node> next;
    Node(int v, std::unique_ptr<Node> n = nullptr) : value(v), next(std::move(n)) {}
};

std::unique_ptr<Node> reverse(std::unique_ptr<Node> head) {
    std::unique_ptr<Node> prev = nullptr;
    while (head) {
        auto next = std::move(head->next);
        head->next = std::move(prev);
        prev = std::move(head);
        head = std::move(next);
    }
    return prev;
}

std::vector<int> toVector(const std::unique_ptr<Node>& head) {
    std::vector<int> result;
    Node* node = head.get();
    while (node) {
        result.push_back(node->value);
        node = node->next.get();
    }
    return result;
}

int main() {
    auto head = std::make_unique<Node>(1, std::make_unique<Node>(2, std::make_unique<Node>(3)));
    for (int x : toVector(reverse(std::move(head)))) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
