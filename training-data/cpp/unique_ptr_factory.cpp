#include <iostream>
#include <memory>

struct Base { virtual ~Base() = default; virtual const char* name() const = 0; };
struct A : Base { const char* name() const override { return "A"; } };
struct B : Base { const char* name() const override { return "B"; } };

std::unique_ptr<Base> make(char c) {
    if (c == 'a') return std::make_unique<A>();
    return std::make_unique<B>();
}

int main() { std::cout << make('a')->name() << make('b')->name() << "\n"; }
