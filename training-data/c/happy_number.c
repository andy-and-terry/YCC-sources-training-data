#include <stdbool.h>
#include <stdio.h>

static int next(int n) {
    int s = 0;
    for (; n > 0; n /= 10) s += (n % 10) * (n % 10);
    return s;
}

bool is_happy(int n) {
    int slow = n, fast = next(n);
    while (fast != 1 && slow != fast) {
        slow = next(slow);
        fast = next(next(fast));
    }
    return fast == 1;
}

int main(void) {
    for (int i = 1; i <= 50; i++)
        if (is_happy(i)) printf("%d ", i);
    printf("\n");
    return 0;
}
