#include <stdio.h>

static unsigned collatz_steps(unsigned long long n) {
    unsigned steps = 0;
    while (n != 1) {
        n = (n % 2 == 0) ? n / 2 : 3 * n + 1;
        steps++;
    }
    return steps;
}

int main(void) {
    unsigned long long inputs[] = {1, 6, 7, 27, 97};
    size_t count = sizeof(inputs) / sizeof(inputs[0]);

    for (size_t i = 0; i < count; i++) {
        printf("%llu -> %u steps\n", inputs[i], collatz_steps(inputs[i]));
    }
    return 0;
}
