#include <stdio.h>

static int next_id(void) {
    static int counter = 0;
    return ++counter;
}

static int fib_cached(int n) {
    static int cache[50];
    if (n < 2) return n;
    if (cache[n]) return cache[n];
    return cache[n] = fib_cached(n - 1) + fib_cached(n - 2);
}

int main(void) {
    for (int i = 0; i < 3; i++) printf("id %d\n", next_id());
    printf("fib(40) = %d\n", fib_cached(40));
    return 0;
}
