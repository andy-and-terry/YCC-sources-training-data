#include <initializer_list>
#include <iostream>
#include <vector>
struct Bag {
    std::vector<int> v;
    Bag(std::initializer_list<int> l) : v(l) {}
};
int main() { Bag b{1, 2, 3}; std::cout << b.v.size() << "\n"; }
