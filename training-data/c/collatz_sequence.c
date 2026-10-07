#include <stdio.h>

int main(void) {
    long n = 27;
    int steps = 0;

    printf("%ld", n);
    while (n != 1) {
        if (n % 2 == 0) {
            n /= 2;
        } else {
            n = 3 * n + 1;
        }
        printf(" %ld", n);
        steps++;
    }
    printf("\nsteps: %d\n", steps);
    return 0;
}
