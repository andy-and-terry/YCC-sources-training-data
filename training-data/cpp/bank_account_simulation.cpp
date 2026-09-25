#include <atomic>
#include <deque>
#include <iostream>
#include <mutex>
#include <random>
#include <stdexcept>
#include <thread>
#include <vector>

class Account {
public:
    explicit Account(long cents) : balance_(cents) {}
    long balance() const {
        std::lock_guard lock(m_);
        return balance_;
    }

    friend bool transfer(Account& from, Account& to, long cents) {
        if (&from == &to) return false;
        std::scoped_lock lock(from.m_, to.m_);  // deadlock-free multi-lock
        if (from.balance_ < cents) return false;
        from.balance_ -= cents;
        to.balance_ += cents;
        return true;
    }

private:
    mutable std::mutex m_;
    long balance_;
};

int main() {
    std::deque<Account> accounts;  // deque never relocates, so non-movable Account is fine
    for (int i = 0; i < 5; ++i) accounts.emplace_back(1000);
    std::vector<std::thread> threads;
    std::atomic<int> rejected{0};
    for (int t = 0; t < 8; ++t) {
        threads.emplace_back([&, t] {
            std::mt19937 rng(static_cast<unsigned>(t));
            std::uniform_int_distribution<int> pick(0, 4), amount(1, 100);
            for (int i = 0; i < 20000; ++i)
                if (!transfer(accounts[pick(rng)], accounts[pick(rng)], amount(rng))) ++rejected;
        });
    }
    for (auto& th : threads) th.join();
    long total = 0;
    for (auto& a : accounts) total += a.balance();
    std::cout << "total " << total << " (expected 5000), rejected " << rejected << '\n';
}
