#include <condition_variable>
#include <iostream>
#include <mutex>
#include <queue>
#include <thread>

template <typename T>
class BoundedQueue {
public:
    explicit BoundedQueue(size_t capacity) : capacity(capacity) {}

    void push(T value) {
        std::unique_lock<std::mutex> lock(mutex);
        notFull.wait(lock, [this]() { return queue.size() < capacity; });
        queue.push(std::move(value));
        lock.unlock();
        notEmpty.notify_one();
    }

    T pop() {
        std::unique_lock<std::mutex> lock(mutex);
        notEmpty.wait(lock, [this]() { return !queue.empty(); });
        T value = std::move(queue.front());
        queue.pop();
        lock.unlock();
        notFull.notify_one();
        return value;
    }

private:
    size_t capacity;
    std::queue<T> queue;
    std::mutex mutex;
    std::condition_variable notFull;
    std::condition_variable notEmpty;
};

int main() {
    BoundedQueue<int> queue(3);
    std::mutex printMutex;

    std::thread producer([&queue]() {
        for (int i = 0; i < 6; i++) queue.push(i);
    });

    std::thread consumer([&queue, &printMutex]() {
        for (int i = 0; i < 6; i++) {
            int value = queue.pop();
            std::lock_guard<std::mutex> lock(printMutex);
            std::cout << "consumed: " << value << std::endl;
        }
    });

    producer.join();
    consumer.join();
    return 0;
}
