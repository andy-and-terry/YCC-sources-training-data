#include <stdio.h>

void fibonacci(int n, long result[]) {
    long a = 0, b = 1;
    for (int i = 0; i < n; i++) {
        result[i] = a;
        long temp = a + b;
        a = b;
        b = temp;
    }
}

int main(void) {
    long result[11];
    fibonacci(11, result);
    for (int i = 0; i < 11; i++) {
        printf("%ld ", result[i]);
    }
    printf("\n");
    return 0;
}
