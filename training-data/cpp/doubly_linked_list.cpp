#include <iostream>
#include <list>

int main() {
    std::list<int> dll = {1, 2, 3, 4};
    dll.remove(3);
    for (int x : dll) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
