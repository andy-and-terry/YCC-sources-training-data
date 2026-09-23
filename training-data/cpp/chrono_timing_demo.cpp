#include <chrono>
#include <iostream>
#include <numeric>
#include <thread>
#include <vector>

using namespace std::chrono_literals;

long busyWork(long iterations) {
    long total = 0;
    for (long i = 0; i < iterations; i++) total += i % 7;
    return total;
}

int main() {
    auto start = std::chrono::steady_clock::now();
    long result = busyWork(5'000'000);
    auto end = std::chrono::steady_clock::now();

    auto elapsed = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    std::cout << "result: " << result << ", elapsed: " << elapsed.count() << "us" << std::endl;

    std::this_thread::sleep_for(50ms);

    std::chrono::seconds oneMinuteInSeconds = std::chrono::minutes(1);
    std::cout << "one minute is " << oneMinuteInSeconds.count() << " seconds" << std::endl;

    return 0;
}
