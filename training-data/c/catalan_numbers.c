#include <stdio.h>

void catalan_numbers(int n, long result[]) {
    result[0] = 1;
    for (int i = 1; i <= n; i++) {
        result[i] = 0;
        for (int j = 0; j < i; j++) {
            result[i] += result[j] * result[i - 1 - j];
        }
    }
}

int main(void) {
    int n = 10;
    long result[11];
    catalan_numbers(n, result);
    for (int i = 0; i <= n; i++) {
        printf("%ld ", result[i]);
    }
    printf("\n");
    return 0;
}
