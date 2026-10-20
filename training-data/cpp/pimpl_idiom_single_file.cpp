#include <iostream>
#include <memory>

class Counter {
    struct Impl { int n = 0; };
    std::unique_ptr<Impl> p_;
public:
    Counter() : p_(std::make_unique<Impl>()) {}
    ~Counter();
    int inc() { return ++p_->n; }
};
Counter::~Counter() = default;

int main() { Counter c; c.inc(); std::cout << c.inc() << "\n"; }
