#include <iostream>
#include <memory>

struct Node {
    int value;
    std::unique_ptr<Node> next;
    explicit Node(int v) : value(v), next(nullptr) {}
};

class LinkedList {
public:
    void append(int value) {
        auto node = std::make_unique<Node>(value);
        if (!head) {
            head = std::move(node);
            return;
        }
        Node* current = head.get();
        while (current->next) current = current->next.get();
        current->next = std::move(node);
    }

    void print() const {
        Node* current = head.get();
        while (current) {
            std::cout << current->value << " ";
            current = current->next.get();
        }
        std::cout << std::endl;
    }

private:
    std::unique_ptr<Node> head;
};

int main() {
    LinkedList list;
    for (int v : {1, 2, 3}) list.append(v);
    list.print();
    return 0;
}
