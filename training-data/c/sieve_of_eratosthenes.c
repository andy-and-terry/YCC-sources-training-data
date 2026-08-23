#include <stdio.h>
#include <string.h>

int main(void) {
    int limit = 50;
    int is_prime[51];
    memset(is_prime, 1, sizeof(is_prime));
    is_prime[0] = is_prime[1] = 0;
    for (int n = 2; n * n <= limit; n++) {
        if (is_prime[n]) {
            for (int m = n * n; m <= limit; m += n) is_prime[m] = 0;
        }
    }
    for (int n = 0; n <= limit; n++) {
        if (is_prime[n]) printf("%d ", n);
    }
    printf("\n");
    return 0;
}
