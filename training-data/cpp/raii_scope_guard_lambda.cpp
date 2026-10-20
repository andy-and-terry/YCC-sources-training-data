#include <functional>
#include <iostream>
#include <utility>

// Minimal scope guard: runs a callback on scope exit, even on early return or throw.
class ScopeGuard {
    std::function<void()> fn_;
public:
    explicit ScopeGuard(std::function<void()> fn) : fn_(std::move(fn)) {}
    ScopeGuard(const ScopeGuard&) = delete;
    ScopeGuard& operator=(const ScopeGuard&) = delete;
    ~ScopeGuard() { if (fn_) fn_(); }
};

int main() {
    ScopeGuard outer([] { std::cout << "outer cleanup\n"; });
    try {
        ScopeGuard inner([] { std::cout << "inner cleanup\n"; });
        throw std::runtime_error("boom");
    } catch (const std::exception& e) {
        std::cout << "caught " << e.what() << "\n";
    }
}
