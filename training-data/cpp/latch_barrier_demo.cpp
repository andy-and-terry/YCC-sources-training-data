#include <iostream>
#include <latch>
#include <mutex>
#include <thread>
#include <vector>

int main() {
    constexpr int workers = 4;
    std::latch ready(workers);      // workers count down when initialized
    std::latch start(1);            // main releases everyone at once
    std::mutex out_mutex;
    std::vector<int> results(workers, 0);

    std::vector<std::thread> threads;
    for (int id = 0; id < workers; ++id) {
        threads.emplace_back([&, id] {
            results[id] = (id + 1) * (id + 1);      // "initialization"
            ready.count_down();
            start.wait();                           // block until released
            std::lock_guard<std::mutex> lock(out_mutex);
            results[id] += 100;
        });
    }

    ready.wait();                    // all workers initialized
    std::cout << "all workers ready" << std::endl;
    start.count_down();              // release the workers

    for (auto& t : threads) t.join();
    for (int r : results) std::cout << r << ' ';
    std::cout << std::endl;
    return 0;
}
