/* Narayana's cows N(n)=N(n-1)+N(n-3) */
#include <stdio.h>

int main(void) {
    long v[10] = { 1, 1, 1 };
    for (int i = 3; i < 10; i++) v[i] = v[i - 1] + v[i - 3];
    for (int i = 0; i < 10; i++) printf("%ld ", v[i]);
    putchar('\n');
    return 0;
}
