#include <iostream>
#include <memory>

struct Node { std::weak_ptr<Node> parent; std::shared_ptr<Node> child; };

int main() {
    auto p = std::make_shared<Node>();
    p->child = std::make_shared<Node>();
    p->child->parent = p;
    std::cout << p.use_count() << " " << p->child.use_count() << "\n";
}
