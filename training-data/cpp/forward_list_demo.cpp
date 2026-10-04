#include <forward_list>
#include <iostream>

template <typename T>
void show(const std::forward_list<T>& fl) {
    for (const auto& v : fl) std::cout << v << ' ';
    std::cout << std::endl;
}

int main() {
    std::forward_list<int> fl = {3, 1, 4, 1, 5, 9, 2, 6};
    show(fl);

    fl.push_front(0);
    auto it = fl.begin();               // points at 0
    fl.insert_after(it, 7);             // insert after, not before
    show(fl);

    fl.erase_after(fl.begin());         // remove the 7
    fl.remove(1);                       // remove all 1s
    show(fl);

    fl.remove_if([](int x) { return x % 2 == 0; });
    show(fl);

    fl.push_front(5);
    fl.sort();
    fl.unique();
    show(fl);

    fl.reverse();
    show(fl);

    std::forward_list<int> other = {100, 200};
    fl.splice_after(fl.before_begin(), other);
    show(fl);

    std::forward_list<int> a = {1, 4, 7}, b = {2, 3, 8};
    a.merge(b);
    show(a);
    std::cout << "empty b: " << b.empty() << std::endl;
    return 0;
}
