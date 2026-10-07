#include <condition_variable>
#include <iostream>
#include <mutex>
#include <thread>

std::mutex m;
std::condition_variable cv;
bool pingTurn = true;

void player(const char* name, bool isPing, int rounds) {
    for (int i = 0; i < rounds; ++i) {
        std::unique_lock<std::mutex> lock(m);
        cv.wait(lock, [&] { return pingTurn == isPing; });
        std::cout << name << "\n";
        pingTurn = !isPing;
        cv.notify_all();
    }
}

int main() {
    std::thread a(player, "ping", true, 3);
    std::thread b(player, "pong", false, 3);
    a.join();
    b.join();
}
