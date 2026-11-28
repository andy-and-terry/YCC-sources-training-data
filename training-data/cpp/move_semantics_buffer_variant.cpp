#include <iostream>
#include <utility>
#include <vector>

struct Buf {
    std::vector<int> d;
    Buf(size_t n) : d(n) {}
    Buf(Buf&& o) noexcept : d(std::move(o.d)) { std::cout << "moved\n"; }
};

int main() {
    Buf a(1000);
    Buf b = std::move(a);
    std::cout << a.d.size() << ' ' << b.d.size() << '\n';
}
