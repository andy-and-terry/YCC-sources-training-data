#include <iostream>
#include <string>
#include <vector>

template <typename T>
struct Box {
    T value;
    Box(T v) : value(std::move(v)) {}
};

template <typename T>
struct Wrapper {
    std::vector<T> items;
    template <typename It>
    Wrapper(It first, It last) : items(first, last) {}
};
template <typename It>
Wrapper(It, It) -> Wrapper<typename std::iterator_traits<It>::value_type>;

Box(const char*) -> Box<std::string>;

int main() {
    Box a(42);
    Box b(3.5);
    Box c("text");  // deduced as Box<std::string> by the guide
    std::vector<int> v{1, 2, 3};
    Wrapper w(v.begin(), v.end());
    std::pair p(1, 'x');
    std::cout << a.value << " " << b.value << " " << c.value.size() << " " << w.items.size() << " " << p.second << "\n";
}
