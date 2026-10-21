#include <stdio.h>

int main(void) {
    long m[10] = {1, 1};
    for (int i = 2; i < 10; i++)
        m[i] = ((2 * i + 1) * m[i - 1] + 3 * (i - 1) * m[i - 2]) / (i + 2);
    for (int i = 0; i < 10; i++) printf("%ld ", m[i]);
    printf("\n");
    return 0;
}
