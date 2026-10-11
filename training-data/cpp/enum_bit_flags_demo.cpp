#include <cstdint>
#include <iostream>
#include <string>

enum class Perm : std::uint8_t { None = 0, Read = 1, Write = 2, Exec = 4 };

constexpr Perm operator|(Perm a, Perm b) { return Perm(std::uint8_t(a) | std::uint8_t(b)); }
constexpr Perm operator&(Perm a, Perm b) { return Perm(std::uint8_t(a) & std::uint8_t(b)); }
constexpr Perm operator~(Perm a) { return Perm(~std::uint8_t(a) & 7); }
constexpr bool has(Perm set, Perm p) { return (set & p) == p; }

std::string to_string(Perm p) {
    std::string s;
    s += has(p, Perm::Read) ? 'r' : '-';
    s += has(p, Perm::Write) ? 'w' : '-';
    s += has(p, Perm::Exec) ? 'x' : '-';
    return s;
}

int main() {
    Perm p = Perm::Read | Perm::Write;
    std::cout << to_string(p) << "\n";
    p = p | Perm::Exec;
    std::cout << to_string(p) << "\n";
    p = p & ~Perm::Write;
    std::cout << to_string(p) << "\n";
}
