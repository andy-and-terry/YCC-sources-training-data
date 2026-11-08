#include <stdio.h>

int main(void) {
    int xs[] = {10, 12, 15, 15, 20}, d[5], back[5];
    d[0] = xs[0];
    for (int i = 1; i < 5; i++) d[i] = xs[i] - xs[i - 1];
    back[0] = d[0];
    for (int i = 1; i < 5; i++) back[i] = back[i - 1] + d[i];
    for (int i = 0; i < 5; i++) printf("%d ", d[i]);
    printf("| ");
    for (int i = 0; i < 5; i++) printf("%d ", back[i]);
    printf("\n");
    return 0;
}
