#include <iostream>

struct Node {
    int value;
    Node* next;
};

bool hasCycle(Node* head) {
    Node* slow = head;
    Node* fast = head;

    while (fast != nullptr && fast->next != nullptr) {
        slow = slow->next;
        fast = fast->next->next;
        if (slow == fast) return true;
    }
    return false;
}

Node* findCycleStart(Node* head) {
    Node* slow = head;
    Node* fast = head;

    while (fast != nullptr && fast->next != nullptr) {
        slow = slow->next;
        fast = fast->next->next;
        if (slow == fast) {
            Node* pointer = head;
            while (pointer != slow) {
                pointer = pointer->next;
                slow = slow->next;
            }
            return pointer;
        }
    }
    return nullptr;
}

int main() {
    Node d{4, nullptr};
    Node c{3, &d};
    Node b{2, &c};
    Node a{1, &b};
    d.next = &b;

    std::cout << "has cycle: " << hasCycle(&a) << std::endl;
    Node* start = findCycleStart(&a);
    std::cout << "cycle starts at: " << (start ? start->value : -1) << std::endl;

    Node y{2, nullptr};
    Node x{1, &y};
    std::cout << "has cycle: " << hasCycle(&x) << std::endl;

    return 0;
}
