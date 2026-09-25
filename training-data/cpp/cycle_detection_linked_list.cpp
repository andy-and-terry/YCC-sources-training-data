#include <iostream>
#include <memory>
#include <optional>
#include <vector>

struct Node {
    int val;
    Node* next = nullptr;
};

struct CycleInfo {
    int start_value;
    int length;
};

std::optional<CycleInfo> detect(Node* head) {
    Node *slow = head, *fast = head;
    while (fast && fast->next) {
        slow = slow->next;
        fast = fast->next->next;
        if (slow != fast) continue;
        int len = 1;
        for (Node* p = slow->next; p != slow; p = p->next) ++len;
        for (slow = head; slow != fast; slow = slow->next, fast = fast->next) {}
        return CycleInfo{slow->val, len};
    }
    return std::nullopt;
}

int main() {
    std::vector<Node> nodes(8);
    for (int i = 0; i < 8; ++i) nodes[i].val = i * 10, nodes[i].next = i + 1 < 8 ? &nodes[i + 1] : nullptr;
    std::cout << (detect(&nodes[0]) ? "cycle" : "no cycle") << '\n';
    nodes[7].next = &nodes[3];
    if (auto c = detect(&nodes[0])) std::cout << "cycle starts at " << c->start_value << ", length " << c->length << '\n';
}
