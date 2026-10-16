#include <atomic>
#include <chrono>
#include <iostream>
#include <thread>

int main() {
    std::atomic<int> ticks{0};
    {
        std::jthread worker([&](std::stop_token st) {
            while (!st.stop_requested()) {
                ++ticks;
                std::this_thread::sleep_for(std::chrono::milliseconds(5));
            }
            std::cout << "worker noticed stop request\n";
        });
        std::this_thread::sleep_for(std::chrono::milliseconds(50));
        worker.request_stop();
    }  // jthread joins automatically
    std::cout << "ticks > 0: " << (ticks > 0) << "\n";
}
