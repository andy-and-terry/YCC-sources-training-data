#include <iostream>
#include <memory>
#include <vector>

class Node : public std::enable_shared_from_this<Node> {
public:
    int id;
    std::vector<std::shared_ptr<Node>> children;
    std::weak_ptr<Node> parent;
    explicit Node(int i) : id(i) {}

    std::shared_ptr<Node> add_child(int cid) {
        auto child = std::make_shared<Node>(cid);
        child->parent = shared_from_this();
        children.push_back(child);
        return child;
    }
    int depth() const {
        int d = 0;
        for (auto p = parent.lock(); p; p = p->parent.lock()) ++d;
        return d;
    }
};

int main() {
    auto root = std::make_shared<Node>(1);
    auto leaf = root->add_child(2)->add_child(3);
    std::cout << "leaf id=" << leaf->id << " depth=" << leaf->depth() << "\n";
    std::cout << "root use_count=" << root.use_count() << "\n";
}
