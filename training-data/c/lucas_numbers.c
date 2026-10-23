#include <stdio.h>

int main(void) {
    long a = 2, b = 1;
    for (int i = 0; i < 10; i++) {
        printf("%ld ", a);
        long next = a + b;
        a = b;
        b = next;
    }
    printf("\n");
    return 0;
}
