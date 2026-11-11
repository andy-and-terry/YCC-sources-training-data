/* Perrin sequence P(n)=P(n-2)+P(n-3) */
#include <stdio.h>

int main(void) {
    long v[10] = { 3, 0, 2 };
    for (int i = 3; i < 10; i++) v[i] = v[i - 2] + v[i - 3];
    for (int i = 0; i < 10; i++) printf("%ld ", v[i]);
    putchar('\n');
    return 0;
}
