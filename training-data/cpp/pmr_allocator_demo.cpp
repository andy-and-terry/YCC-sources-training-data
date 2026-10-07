#include <array>
#include <cstddef>
#include <iostream>
#include <memory_resource>
#include <vector>

int main() {
    std::array<std::byte, 256> buffer;
    std::pmr::monotonic_buffer_resource pool(buffer.data(), buffer.size());

    std::pmr::vector<int> numbers(&pool);
    for (int i = 0; i < 10; i++) numbers.push_back(i * i);

    for (int n : numbers) std::cout << n << " ";
    std::cout << std::endl;

    std::pmr::vector<std::pmr::string> words(&pool);
    words.emplace_back("alpha");
    words.emplace_back("beta");
    for (const auto& word : words) std::cout << word << " ";
    std::cout << std::endl;

    return 0;
}
