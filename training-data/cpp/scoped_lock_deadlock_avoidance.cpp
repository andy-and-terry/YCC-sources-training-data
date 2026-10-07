#include <iostream>
#include <mutex>
#include <thread>

struct Account {
    std::mutex m;
    int balance;
};

// std::scoped_lock acquires both mutexes with a deadlock-avoidance algorithm,
// so opposite transfer directions cannot deadlock.
void transfer(Account& from, Account& to, int amount) {
    std::scoped_lock lock(from.m, to.m);
    from.balance -= amount;
    to.balance += amount;
}

int main() {
    Account a{.balance = 1000}, b{.balance = 1000};
    std::thread t1([&] { for (int i = 0; i < 1000; ++i) transfer(a, b, 1); });
    std::thread t2([&] { for (int i = 0; i < 1000; ++i) transfer(b, a, 2); });
    t1.join();
    t2.join();
    std::cout << a.balance << " " << b.balance << "\n";  // 1000 + 1000 = 2000 total
}
