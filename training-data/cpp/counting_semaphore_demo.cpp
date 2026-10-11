#include <iostream>
#include <mutex>
#include <semaphore>
#include <thread>
#include <vector>

std::counting_semaphore<3> slots(3);
std::mutex out_mutex;
int active = 0, peak = 0;

void job(int id) {
    slots.acquire();
    {
        std::lock_guard lk(out_mutex);
        peak = std::max(peak, ++active);
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(10));
    {
        std::lock_guard lk(out_mutex);
        --active;
    }
    slots.release();
}

int main() {
    std::vector<std::thread> ts;
    for (int i = 0; i < 8; ++i) ts.emplace_back(job, i);
    for (auto& t : ts) t.join();
    std::cout << "peak concurrency <= 3: " << (peak <= 3) << "\n";
}
