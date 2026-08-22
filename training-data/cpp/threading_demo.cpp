#include <atomic>
#include <iostream>
#include <thread>
#include <vector>

int main() {
    std::atomic<long> counter{0};
    std::vector<std::thread> threads;

    for (int i = 0; i < 10; i++) {
        threads.emplace_back([&counter]() {
            for (int j = 0; j < 1000; j++) counter++;
        });
    }

    for (auto& t : threads) t.join();

    std::cout << "Final count: " << counter.load() << std::endl;
    return 0;
}
