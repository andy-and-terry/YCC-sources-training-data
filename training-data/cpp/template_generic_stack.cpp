#include <iostream>
#include <optional>
#include <vector>

template <typename T>
class Stack {
public:
    void push(T item) { items.push_back(std::move(item)); }

    std::optional<T> pop() {
        if (items.empty()) return std::nullopt;
        T item = std::move(items.back());
        items.pop_back();
        return item;
    }

    bool isEmpty() const { return items.empty(); }

private:
    std::vector<T> items;
};

template <typename T, typename U, typename F>
std::vector<U> mapVector(const std::vector<T>& items, F fn) {
    std::vector<U> result;
    result.reserve(items.size());
    for (const auto& item : items) result.push_back(fn(item));
    return result;
}

int main() {
    Stack<int> s;
    s.push(1);
    s.push(2);
    s.push(3);
    std::cout << *s.pop() << " " << s.isEmpty() << std::endl;

    std::vector<int> nums = {1, 2, 3};
    auto doubled = mapVector<int, int>(nums, [](int n) { return n * 2; });
    for (int x : doubled) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
