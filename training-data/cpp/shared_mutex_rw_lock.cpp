#include <iostream>
#include <mutex>
#include <shared_mutex>
#include <thread>
#include <vector>

class SharedCounter {
public:
    int read() const {
        std::shared_lock<std::shared_mutex> lock(mutex);
        return value;
    }

    void write(int newValue) {
        std::unique_lock<std::shared_mutex> lock(mutex);
        value = newValue;
    }

private:
    mutable std::shared_mutex mutex;
    int value = 0;
};

int main() {
    SharedCounter counter;
    std::vector<std::thread> readers;
    std::mutex printMutex;

    std::thread writer([&counter]() {
        for (int i = 1; i <= 5; i++) {
            counter.write(i);
            std::this_thread::sleep_for(std::chrono::milliseconds(5));
        }
    });

    for (int i = 0; i < 3; i++) {
        readers.emplace_back([&counter, &printMutex, i]() {
            std::this_thread::sleep_for(std::chrono::milliseconds(10));
            int seen = counter.read();
            std::lock_guard<std::mutex> lock(printMutex);
            std::cout << "reader " << i << " saw " << seen << std::endl;
        });
    }

    writer.join();
    for (auto& t : readers) t.join();
    return 0;
}
