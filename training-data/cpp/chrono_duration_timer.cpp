#include <chrono>
#include <iostream>
#include <thread>

int main() {
    using namespace std::chrono;
    auto t0 = steady_clock::now();
    std::this_thread::sleep_for(20ms);
    auto ms = duration_cast<milliseconds>(steady_clock::now() - t0).count();
    std::cout << (ms >= 20) << " " << duration_cast<seconds>(90min).count() << "\n";
}
