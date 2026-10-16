#include <future>
#include <iostream>
#include <numeric>
#include <thread>
#include <vector>

int sum_range(int lo, int hi) {
    std::vector<int> v(hi - lo);
    std::iota(v.begin(), v.end(), lo);
    return std::accumulate(v.begin(), v.end(), 0);
}

int main() {
    std::packaged_task<int(int, int)> task(sum_range);
    std::future<int> fut = task.get_future();
    std::thread t(std::move(task), 1, 101);
    std::cout << "sum 1..100 = " << fut.get() << "\n";
    t.join();

    std::promise<std::string> p;
    auto f = p.get_future();
    std::thread worker([&p] { p.set_value("hello from worker"); });
    std::cout << f.get() << "\n";
    worker.join();
}
