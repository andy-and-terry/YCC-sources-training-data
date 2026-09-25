#include <stdbool.h>
#include <stdio.h>

static int step(int n) {
    int s = 0;
    for (; n; n /= 10) s += (n % 10) * (n % 10);
    return s;
}

bool is_happy(int n) {
    int slow = n, fast = step(n);
    while (fast != 1 && slow != fast) {
        slow = step(slow);
        fast = step(step(fast));
    }
    return fast == 1;
}

int main(void) {
    for (int i = 1; i <= 50; i++)
        if (is_happy(i)) printf("%d ", i);
    putchar('\n');
    return 0;
}
