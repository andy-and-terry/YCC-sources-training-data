#include <format>
#include <iostream>
#include <string>

int main() {
    std::string s = std::format("{} + {} = {}", 2, 3, 2 + 3);
    std::cout << s << "\n";
    std::cout << std::format("[{:>8}] [{:<8}] [{:^8}]", "right", "left", "mid") << "\n";
    std::cout << std::format("{:08.3f} {:+d} {:#x} {:#b}", 3.14159, 42, 255, 5) << "\n";
    std::cout << std::format("{1} before {0}", "A", "B") << "\n";
    std::cout << std::format("{:*^11}", "title") << "\n";
    std::cout << std::format("{:>{}}", 7, 5) << "\n";
}
