#include <future>
#include <iostream>
#include <numeric>
#include <vector>

long partialSum(const std::vector<int>& data, size_t begin, size_t end) {
    return std::accumulate(data.begin() + begin, data.begin() + end, 0L);
}

int main() {
    std::vector<int> data(1000);
    std::iota(data.begin(), data.end(), 1);

    size_t mid = data.size() / 2;
    std::future<long> firstHalf = std::async(std::launch::async, partialSum, std::cref(data), 0, mid);
    std::future<long> secondHalf = std::async(std::launch::async, partialSum, std::cref(data), mid, data.size());

    long total = firstHalf.get() + secondHalf.get();
    std::cout << "total: " << total << std::endl;

    std::promise<int> promise;
    std::future<int> promised = promise.get_future();
    std::thread producer([&promise]() { promise.set_value(42); });
    std::cout << "promised value: " << promised.get() << std::endl;
    producer.join();

    return 0;
}
