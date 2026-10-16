#include <stdio.h>
#include <time.h>

int main(void) {
    clock_t start = clock();
    volatile unsigned long acc = 0;
    for (unsigned long i = 0; i < 5000000UL; i++) acc += i;
    clock_t end = clock();
    double sec = (double)(end - start) / CLOCKS_PER_SEC;
    printf("sum computed, cpu time non-negative: %s\n", sec >= 0 ? "yes" : "no");
    return 0;
}
