#include <chrono>
#include <iostream>

class TokenBucket {
public:
    TokenBucket(double capacity, double refillRate)
        : capacity(capacity), tokens(capacity), refillRate(refillRate), lastRefill(std::chrono::steady_clock::now()) {}

    bool tryConsume(double amount) {
        refill();
        if (tokens >= amount) {
            tokens -= amount;
            return true;
        }
        return false;
    }

private:
    double capacity, tokens, refillRate;
    std::chrono::steady_clock::time_point lastRefill;

    void refill() {
        auto now = std::chrono::steady_clock::now();
        double elapsed = std::chrono::duration<double>(now - lastRefill).count();
        tokens = std::min(capacity, tokens + elapsed * refillRate);
        lastRefill = now;
    }
};

int main() {
    TokenBucket bucket(5, 1);
    for (int i = 0; i < 7; i++) std::cout << bucket.tryConsume(1) << " ";
    std::cout << std::endl;
    return 0;
}
