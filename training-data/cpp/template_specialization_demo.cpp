#include <iostream>
#include <string>

template <typename T>
struct Describe {
    static std::string name() { return "generic"; }
};

template <>
struct Describe<int> {
    static std::string name() { return "int"; }
};

template <typename T>
struct Describe<T*> {                       // partial specialization
    static std::string name() { return "pointer to " + Describe<T>::name(); }
};

int main() {
    std::cout << Describe<double>::name() << "\n";
    std::cout << Describe<int>::name() << "\n";
    std::cout << Describe<int*>::name() << "\n";
    std::cout << Describe<double**>::name() << "\n";
}
