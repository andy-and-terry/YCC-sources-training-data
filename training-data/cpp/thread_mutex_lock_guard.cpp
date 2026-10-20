#include <iostream>
#include <mutex>
#include <thread>
#include <vector>

int main() {
    int total = 0;
    std::mutex m;
    std::vector<std::thread> ts;
    for (int i = 0; i < 4; i++) ts.emplace_back([&] { for (int j = 0; j < 1000; j++) { std::lock_guard<std::mutex> g(m); total++; } });
    for (auto& t : ts) t.join();
    std::cout << total << "\n";
}
