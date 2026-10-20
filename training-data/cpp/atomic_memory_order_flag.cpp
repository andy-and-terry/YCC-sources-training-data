#include <atomic>
#include <iostream>
#include <thread>

int main() {
    std::atomic<bool> ready{false};
    int payload = 0;
    std::thread w([&] { payload = 99; ready.store(true, std::memory_order_release); });
    while (!ready.load(std::memory_order_acquire)) {}
    std::cout << payload << "\n";
    w.join();
    std::atomic<int> c{0};
    c.fetch_add(5, std::memory_order_relaxed);
    int exp = 5;
    std::cout << c.compare_exchange_strong(exp, 8) << c << "\n";
}
