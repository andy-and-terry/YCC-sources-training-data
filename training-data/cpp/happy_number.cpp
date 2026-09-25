#include <iostream>

int step(int n) {
    int s = 0;
    for (; n; n /= 10) s += (n % 10) * (n % 10);
    return s;
}

bool isHappy(int n) {
    int slow = n, fast = step(n);
    while (fast != 1 && slow != fast) {
        slow = step(slow);
        fast = step(step(fast));
    }
    return fast == 1;
}

int main() {
    for (int i = 1; i <= 50; ++i)
        if (isHappy(i)) std::cout << i << ' ';
    std::cout << '\n';
}
