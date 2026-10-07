#include <iostream>
#include <mutex>
#include <stdexcept>
#include <thread>
#include <vector>

class BankAccount {
public:
    void deposit(long amount) {
        std::lock_guard<std::mutex> lock(mu_);
        balance_ += amount;
    }

    void withdraw(long amount) {
        std::lock_guard<std::mutex> lock(mu_);
        if (amount > balance_) throw std::runtime_error("insufficient funds");
        balance_ -= amount;
    }

    long balance() const {
        std::lock_guard<std::mutex> lock(mu_);
        return balance_;
    }

private:
    mutable std::mutex mu_;
    long balance_ = 0;
};

int main() {
    BankAccount acct;
    std::vector<std::thread> threads;
    for (int t = 0; t < 8; ++t)
        threads.emplace_back([&] { for (int i = 0; i < 1000; ++i) acct.deposit(1); });
    for (auto& t : threads) t.join();
    std::cout << acct.balance() << '\n';
    try { acct.withdraw(1'000'000); } catch (const std::exception& e) { std::cout << e.what() << '\n'; }
}
