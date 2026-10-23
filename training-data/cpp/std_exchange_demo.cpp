#include <iostream>
#include <utility>
#include <vector>

struct Buffer {
    int* data;
    explicit Buffer(int n) : data(new int[n]{}) {}
    Buffer(Buffer&& o) noexcept : data(std::exchange(o.data, nullptr)) {}
    ~Buffer() { delete[] data; }
};

int main() {
    int x = 5;
    int old = std::exchange(x, 10);
    std::cout << "old=" << old << " new=" << x << "\n";

    std::vector<int> v{1, 2, 3};
    auto prev = std::exchange(v, {});
    std::cout << "prev size=" << prev.size() << " v size=" << v.size() << "\n";

    Buffer a(4);
    Buffer b(std::move(a));
    std::cout << "a.data is " << (a.data ? "set" : "null") << "\n";
}
