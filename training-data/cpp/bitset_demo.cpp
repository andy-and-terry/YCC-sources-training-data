#include <bitset>
#include <iostream>

int main() {
    std::bitset<8> a(0b10110010), b("00001111");
    std::cout << a << " & " << b << " = " << (a & b) << "\n";
    std::cout << "count=" << a.count() << " any=" << a.any() << " test(1)=" << a.test(1) << "\n";
    a.flip(0).set(2).reset(7);
    std::cout << a << " -> " << a.to_ulong() << "\n";
}
