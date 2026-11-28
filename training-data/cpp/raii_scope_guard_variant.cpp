#include <iostream>
#include <utility>

template <class F> struct ScopeGuard {
    F f;
    ~ScopeGuard() { f(); }
};
template <class F> ScopeGuard(F) -> ScopeGuard<F>;

int main() {
    ScopeGuard g{[] { std::cout << "cleanup\n"; }};
    std::cout << "working\n";
}
