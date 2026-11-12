#include <iostream>
#include <memory>
struct B;
struct A { std::shared_ptr<B> b; ~A() { std::cout << "~A\n"; } };
struct B { std::weak_ptr<A> a; ~B() { std::cout << "~B\n"; } };
int main() {
    auto a = std::make_shared<A>();
    a->b = std::make_shared<B>();
    a->b->a = a;
    std::cout << a.use_count() << "\n";
}
