#include <algorithm>
#include <charconv>
#include <cstdint>
#include <iostream>
#include <stdexcept>
#include <string>
#include <string_view>

std::string to_base(std::int64_t n, int base) {
    if (base < 2 || base > 36) throw std::out_of_range("base");
    char buf[80];
    auto [ptr, ec] = std::to_chars(buf, buf + sizeof buf, n, base);
    return std::string(buf, ptr);
}

std::int64_t from_base(std::string_view s, int base) {
    std::int64_t v{};
    auto [ptr, ec] = std::from_chars(s.data(), s.data() + s.size(), v, base);
    if (ec != std::errc{} || ptr != s.data() + s.size()) throw std::invalid_argument(std::string(s));
    return v;
}

// Manual conversion for arbitrary digit alphabets (e.g. base58-like).
std::string encode(std::uint64_t n, std::string_view alphabet) {
    if (n == 0) return std::string(1, alphabet[0]);
    std::string out;
    for (; n; n /= alphabet.size()) out += alphabet[n % alphabet.size()];
    std::reverse(out.begin(), out.end());
    return out;
}

int main() {
    for (auto [n, b] : {std::pair{255LL, 2}, {255LL, 16}, {-1295LL, 36}, {9223372036854775807LL, 36}}) {
        auto s = to_base(n, b);
        std::cout << n << " base " << b << " = " << s << (from_base(s, b) == n ? " ok" : " FAIL") << '\n';
    }
    std::cout << encode(1234567890, "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz") << '\n';
}
