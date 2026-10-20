#include <iostream>

template <typename T> struct Name { static constexpr const char* v = "unknown"; };
template <> struct Name<int> { static constexpr const char* v = "int"; };
template <typename T> struct Name<T*> { static constexpr const char* v = "pointer"; };

template <typename T> struct Rank { static constexpr int v = 0; };
template <typename T, size_t N> struct Rank<T[N]> { static constexpr int v = 1 + Rank<T>::v; };

int main() { std::cout << Name<int>::v << Name<char*>::v << Name<double>::v << Rank<int[2][3]>::v << "\n"; }
