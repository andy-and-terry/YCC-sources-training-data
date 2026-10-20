#include <future>
#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<int> v(1000);
    std::iota(v.begin(), v.end(), 1);
    auto half = [&](int lo, int hi) { return std::accumulate(v.begin() + lo, v.begin() + hi, 0); };
    auto f1 = std::async(std::launch::async, half, 0, 500);
    auto f2 = std::async(std::launch::async, half, 500, 1000);
    std::promise<int> p;
    auto fp = p.get_future();
    std::thread([&p] { p.set_value(7); }).join();
    std::cout << f1.get() + f2.get() << " " << fp.get() << "\n";
}
