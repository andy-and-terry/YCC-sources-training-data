#include <iostream>
#include <type_traits>

enum class Perm : unsigned { None = 0, R = 1, W = 2, X = 4 };
constexpr Perm operator|(Perm a, Perm b) { return Perm(std::underlying_type_t<Perm>(a) | std::underlying_type_t<Perm>(b)); }
constexpr bool has(Perm a, Perm b) { return (std::underlying_type_t<Perm>(a) & std::underlying_type_t<Perm>(b)) != 0; }

int main() { auto p = Perm::R | Perm::X; std::cout << has(p, Perm::X) << has(p, Perm::W) << "\n"; }
