#include <stdio.h>
#include <stdlib.h>

static int count_primes_below(int n) {
    if (n < 3) return 0;
    char *composite = calloc(n, 1);
    int count = 0;
    for (int i = 2; i < n; i++) {
        if (composite[i]) continue;
        count++;
        for (long j = (long)i * i; j < n; j += i) composite[j] = 1;
    }
    free(composite);
    return count;
}

int main(void) {
    printf("%d\n", count_primes_below(100));
    return 0;
}
