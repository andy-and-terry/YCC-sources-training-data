/* Square of the sum minus sum of squares for 1..10 (expect 2640) */
#include <stdio.h>

int main(void) {
    long sum = 0, squares = 0;
    for (long i = 1; i <= 10; i++) { sum += i; squares += i * i; }
    printf("%ld\n", sum * sum - squares);
    return 0;
}
