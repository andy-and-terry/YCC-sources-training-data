#include <algorithm>
#include <iostream>
#include <utility>
#include <vector>

template <typename T>
class MinStack {
    std::vector<std::pair<T, T>> items_;

public:
    void push(const T &v) {
        T m = items_.empty() ? v : std::min(v, items_.back().second);
        items_.emplace_back(v, m);
    }
    T pop() {
        T v = items_.back().first;
        items_.pop_back();
        return v;
    }
    const T &min() const { return items_.back().second; }
};

int main() {
    MinStack<int> s;
    for (int v : {5, 3, 7, 2}) s.push(v);
    std::cout << s.min() << '\n';
    s.pop();
    std::cout << s.min() << '\n';
}
