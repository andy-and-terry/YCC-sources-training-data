#include <iostream>
#include <utility>
#include <vector>

struct Buf {
    std::vector<int> d;
    Buf(size_t n) : d(n, 7) {}
    Buf(Buf&& o) noexcept : d(std::move(o.d)) {}
};

int main() {
    Buf a(3);
    Buf b(std::move(a));
    std::cout << a.d.size() << " " << b.d.size() << "\n";
}
