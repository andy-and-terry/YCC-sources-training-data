#include <chrono>
#include <functional>
#include <iostream>
#include <random>
#include <stdexcept>
#include <thread>

template <typename F>
auto retry(F&& op, int attempts, std::chrono::milliseconds base, std::chrono::milliseconds cap) -> decltype(op()) {
    std::mt19937 rng(std::random_device{}());
    for (int attempt = 1;; ++attempt) {
        try {
            return op();
        } catch (const std::runtime_error& e) {
            if (attempt >= attempts) throw;
            auto ceiling = std::min(cap, base * (1 << attempt));
            std::uniform_int_distribution<long> jitter(0, ceiling.count());
            auto delay = std::chrono::milliseconds(jitter(rng));
            std::cout << "attempt " << attempt << " failed (" << e.what() << "), waiting " << delay.count() << "ms\n";
            std::this_thread::sleep_for(delay);
        }
    }
}

int main() {
    int calls = 0;
    auto result = retry([&] {
        if (++calls < 4) throw std::runtime_error("timeout");
        return std::string("ok");
    }, 5, std::chrono::milliseconds(10), std::chrono::milliseconds(200));
    std::cout << result << " after " << calls << " calls\n";
}
