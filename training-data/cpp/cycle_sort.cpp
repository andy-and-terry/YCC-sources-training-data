#include <iostream>
#include <vector>

// Sorts with the minimum number of writes; returns the write count.
template <typename T>
std::size_t cycle_sort(std::vector<T>& a) {
    std::size_t writes = 0;
    auto position = [&](const T& item, std::size_t start) {
        std::size_t pos = start;
        for (std::size_t i = start + 1; i < a.size(); ++i)
            if (a[i] < item) ++pos;
        return pos;
    };
    for (std::size_t start = 0; start + 1 < a.size(); ++start) {
        T item = a[start];
        std::size_t pos = position(item, start);
        if (pos == start) continue;
        while (item == a[pos]) ++pos;
        std::swap(item, a[pos]);
        ++writes;
        while (pos != start) {
            pos = position(item, start);
            while (item == a[pos]) ++pos;
            std::swap(item, a[pos]);
            ++writes;
        }
    }
    return writes;
}

int main() {
    std::vector<int> v{1, 8, 3, 9, 10, 10, 2, 4};
    auto w = cycle_sort(v);
    for (int x : v) std::cout << x << ' ';
    std::cout << "writes=" << w << '\n';
}
