#include <functional>
#include <iostream>

class ScopeGuard {
    std::function<void()> f_; bool active_ = true;
public:
    explicit ScopeGuard(std::function<void()> f) : f_(std::move(f)) {}
    ~ScopeGuard() { if (active_) f_(); }
    void dismiss() { active_ = false; }
};

int main() {
    ScopeGuard a([] { std::cout << "cleanup a\n"; });
    ScopeGuard b([] { std::cout << "cleanup b\n"; });
    b.dismiss();
    std::cout << "body\n";
}
