#include <iostream>

class Range {
    int a_, b_;
public:
    Range(int a, int b) : a_(a), b_(b) {}
    struct It {
        int v;
        int operator*() const { return v; }
        It& operator++() { ++v; return *this; }
        bool operator!=(const It& o) const { return v != o.v; }
    };
    It begin() const { return {a_}; }
    It end() const { return {b_}; }
};

int main() { for (int i : Range(3, 7)) std::cout << i; std::cout << "\n"; }
