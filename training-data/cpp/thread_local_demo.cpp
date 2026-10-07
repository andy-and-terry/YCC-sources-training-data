#include <iostream>
#include <mutex>
#include <thread>

thread_local int perThread = 0;
std::mutex outMutex;

void work(int id) {
    for (int i = 0; i < id * 10; ++i) ++perThread;   // no synchronization needed
    std::lock_guard<std::mutex> g(outMutex);
    std::cout << "thread " << id << " perThread = " << perThread << "\n";
}

int main() {
    std::thread a(work, 1), b(work, 2), c(work, 3);
    a.join(); b.join(); c.join();
    std::cout << "main perThread = " << perThread << "\n";   // still 0
}
