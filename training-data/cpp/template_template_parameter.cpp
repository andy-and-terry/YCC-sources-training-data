#include <deque>
#include <iostream>
#include <string>
#include <list>
#include <vector>

// A stack adapter parameterised on the container template itself.
template <typename T, template <typename, typename> class Container = std::deque>
class Stack {
    Container<T, std::allocator<T>> items_;
public:
    void push(const T& v) { items_.push_back(v); }
    void pop() { items_.pop_back(); }
    const T& top() const { return items_.back(); }
    bool empty() const { return items_.empty(); }
    std::size_t size() const { return items_.size(); }
};

template <template <typename, typename> class C, typename T>
C<T, std::allocator<T>> make_range(T first, T last) {
    C<T, std::allocator<T>> out;
    for (T v = first; v <= last; ++v) out.push_back(v);
    return out;
}

template <typename Seq>
void show(const char* label, const Seq& s) {
    std::cout << label << ':';
    for (const auto& x : s) std::cout << ' ' << x;
    std::cout << '\n';
}

int main() {
    Stack<int> a;                     // default container: deque
    Stack<int, std::vector> b;
    Stack<std::string, std::list> c;

    for (int i = 1; i <= 3; ++i) { a.push(i); b.push(i * 10); }
    c.push("x");
    c.push("y");

    std::cout << "deque top=" << a.top() << " size=" << a.size() << '\n';
    std::cout << "vector top=" << b.top() << " size=" << b.size() << '\n';
    std::cout << "list top=" << c.top() << " size=" << c.size() << '\n';
    c.pop();
    std::cout << "list top after pop=" << c.top() << '\n';

    show("vector range", make_range<std::vector>(1, 5));
    show("list range", make_range<std::list>(5, 8));
}
