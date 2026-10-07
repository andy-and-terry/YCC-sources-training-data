#include <stdio.h>

static int collatz_steps(unsigned long long n) {
    int steps = 0;
    while (n != 1) {
        n = (n % 2 == 0) ? n / 2 : 3 * n + 1;
        steps++;
    }
    return steps;
}

int main(void) {
    unsigned long long inputs[] = {1, 6, 7, 27, 97};
    for (size_t i = 0; i < sizeof inputs / sizeof inputs[0]; i++)
        printf("collatz(%llu) = %d steps\n", inputs[i], collatz_steps(inputs[i]));
    return 0;
}
