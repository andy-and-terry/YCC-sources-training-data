#include <initializer_list>
#include <iostream>
#include <vector>

struct Bag {
    int n = 0;
    Bag(int count) : n(count) { std::cout << "count\n"; }
    Bag(std::initializer_list<int> il) : n((int)il.size()) { std::cout << "list\n"; }
};

int main() {
    Bag a(3), b{3}, c{1, 2, 3};
    std::vector<int> v1(3), v2{3};
    std::cout << a.n << b.n << c.n << v1.size() << v2.size() << "\n";
}
