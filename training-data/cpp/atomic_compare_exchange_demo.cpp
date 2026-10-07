#include <iostream>
#include <atomic>
#include <thread>
#include <vector>

std::atomic<int> maxSeen{0};

void tryUpdateMax(int candidate) {
    int current = maxSeen.load();
    while (candidate > current &&
           !maxSeen.compare_exchange_weak(current, candidate)) {
        // current is refreshed with the latest value on failure; retry.
    }
}

int main() {
    std::vector<std::thread> workers;
    int values[] = {3, 17, 9, 42, 8, 23};

    for (int v : values) {
        workers.emplace_back(tryUpdateMax, v);
    }
    for (auto& t : workers) t.join();

    std::cout << "max seen: " << maxSeen.load() << std::endl;
    return 0;
}
