#include <atomic>
#include <condition_variable>
#include <functional>
#include <iostream>
#include <mutex>
#include <queue>
#include <thread>
#include <vector>

class ThreadPool {
public:
    explicit ThreadPool(size_t workerCount) {
        for (size_t i = 0; i < workerCount; i++) {
            workers.emplace_back([this]() { workerLoop(); });
        }
    }

    ~ThreadPool() {
        {
            std::lock_guard<std::mutex> lock(mutex);
            stopping = true;
        }
        condition.notify_all();
        for (auto& worker : workers) worker.join();
    }

    void submit(std::function<void()> task) {
        {
            std::lock_guard<std::mutex> lock(mutex);
            tasks.push(std::move(task));
        }
        condition.notify_one();
    }

private:
    std::vector<std::thread> workers;
    std::queue<std::function<void()>> tasks;
    std::mutex mutex;
    std::condition_variable condition;
    bool stopping = false;

    void workerLoop() {
        while (true) {
            std::function<void()> task;
            {
                std::unique_lock<std::mutex> lock(mutex);
                condition.wait(lock, [this]() { return stopping || !tasks.empty(); });
                if (stopping && tasks.empty()) return;
                task = std::move(tasks.front());
                tasks.pop();
            }
            task();
        }
    }
};

int main() {
    ThreadPool pool(4);
    std::mutex printMutex;
    std::atomic<int> completed{0};

    for (int i = 0; i < 8; i++) {
        pool.submit([i, &printMutex, &completed]() {
            {
                std::lock_guard<std::mutex> lock(printMutex);
                std::cout << "task " << i << " ran on thread " << std::this_thread::get_id() << std::endl;
            }
            completed++;
        });
    }

    std::this_thread::sleep_for(std::chrono::milliseconds(200));
    std::cout << "completed: " << completed.load() << std::endl;
    return 0;
}
