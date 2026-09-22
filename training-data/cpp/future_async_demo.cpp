#include <iostream>
#include <future>
#include <thread>
#include <vector>
#include <numeric>

long sumRange(long start, long end) {
    long total = 0;
    for (long i = start; i < end; ++i) total += i;
    return total;
}

int main() {
    std::future<long> f1 = std::async(std::launch::async, sumRange, 0, 500000);
    std::future<long> f2 = std::async(std::launch::async, sumRange, 500000, 1000000);

    long result = f1.get() + f2.get();
    std::cout << "sum 0..999999 = " << result << std::endl;

    std::promise<int> prom;
    std::future<int> fut = prom.get_future();
    std::thread producer([&prom]() { prom.set_value(42); });
    std::cout << "promise value: " << fut.get() << std::endl;
    producer.join();

    return 0;
}
