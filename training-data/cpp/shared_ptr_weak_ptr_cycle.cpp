#include <iostream>
#include <memory>

// weak_ptr breaks a parent<->child ownership cycle.
struct Child;
struct Parent {
    std::shared_ptr<Child> child;
    ~Parent() { std::cout << "Parent gone\n"; }
};
struct Child {
    std::weak_ptr<Parent> parent;
    ~Child() { std::cout << "Child gone\n"; }
};

int main() {
    auto p = std::make_shared<Parent>();
    p->child = std::make_shared<Child>();
    p->child->parent = p;
    std::cout << p.use_count() << " " << p->child.use_count() << "\n";
    if (auto locked = p->child->parent.lock()) std::cout << "parent alive\n";
}
