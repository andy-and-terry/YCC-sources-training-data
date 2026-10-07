#include <iostream>
#include <mutex>
#include <thread>

std::once_flag flag;

void init() { std::cout << "initialized once\n"; }

void work(int id) {
    std::call_once(flag, init);
    std::cout << "worker " << id << " ready\n";
}

int main() {
    std::thread t1(work, 1), t2(work, 2), t3(work, 3);
    t1.join(); t2.join(); t3.join();
}
