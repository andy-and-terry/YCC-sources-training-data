#include <functional>
#include <iostream>
#include <memory>
#include <vector>

int main() {
    int base = 10;

    auto by_value = [base](int x) { return x + base; };
    auto by_ref = [&base](int x) { return x + base; };
    auto mutable_copy = [base](int x) mutable { base += x; return base; };

    base = 100;
    std::cout << by_value(1) << " " << by_ref(1) << std::endl;      // 11 101
    std::cout << mutable_copy(5) << " " << mutable_copy(5) << std::endl;  // 15 20
    std::cout << base << std::endl;

    // init-capture: move a unique_ptr into the lambda
    auto ptr = std::make_unique<int>(42);
    auto owner = [p = std::move(ptr)]() { return *p; };
    std::cout << owner() << std::endl;

    // generic lambda
    auto add = [](auto a, auto b) { return a + b; };
    std::cout << add(1, 2) << " " << add(1.5, 2.5) << " " << add(std::string("a"), std::string("b")) << std::endl;

    // lambdas stored in std::function and returned from functions
    auto make_counter = [] {
        int count = 0;
        return [count]() mutable { return ++count; };
    };
    auto c1 = make_counter();
    auto c2 = make_counter();
    std::cout << c1() << c1() << c1() << " " << c2() << std::endl;

    std::vector<std::function<int(int)>> pipeline = {
        [](int x) { return x + 1; },
        [](int x) { return x * 2; },
        [](int x) { return x - 3; },
    };
    int v = 5;
    for (auto& f : pipeline) v = f(v);
    std::cout << v << std::endl;

    // immediately invoked lambda initializes a const
    const int table_size = [] { int n = 1; while (n < 100) n *= 2; return n; }();
    std::cout << table_size << std::endl;
    return 0;
}
