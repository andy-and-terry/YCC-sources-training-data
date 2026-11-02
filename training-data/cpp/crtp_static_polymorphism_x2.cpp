#include <iostream>

template <typename D>
struct Base { void hello() { static_cast<D*>(this)->impl(); } };
struct Impl : Base<Impl> { void impl() { std::cout << "impl\n"; } };

int main() { Impl{}.hello(); }
