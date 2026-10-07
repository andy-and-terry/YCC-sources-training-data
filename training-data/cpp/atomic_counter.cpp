#include <atomic>
#include <iostream>
#include <thread>
#include <vector>

int main() {
    std::atomic<int> counter{0};
    std::vector<std::thread> threads;
    for (int t = 0; t < 4; ++t)
        threads.emplace_back([&counter] {
            for (int i = 0; i < 100000; ++i)
                counter.fetch_add(1, std::memory_order_relaxed);
        });
    for (auto& th : threads) th.join();
    std::cout << "counter = " << counter.load() << "\n";
}
