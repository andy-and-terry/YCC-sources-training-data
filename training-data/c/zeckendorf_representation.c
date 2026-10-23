#include <stdio.h>

int main(void) {
    long long fibs[64] = {1, 2};
    long long n = 100;
    int count = 2;
    while (fibs[count - 1] <= n) {
        fibs[count] = fibs[count - 1] + fibs[count - 2];
        count++;
    }
    int first = 1;
    for (int i = count - 1; i >= 0; i--) {
        if (fibs[i] <= n) {
            printf("%s%lld", first ? "" : " ", fibs[i]);
            n -= fibs[i];
            first = 0;
        }
    }
    printf("\n");
    return 0;
}
