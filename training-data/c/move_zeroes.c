#include <stdio.h>
#include <string.h>

void move_zeroes(int *a, int n) {
    int w = 0;
    for (int r = 0; r < n; r++)
        if (a[r] != 0) a[w++] = a[r];
    memset(a + w, 0, (size_t)(n - w) * sizeof *a);
}

int main(void) {
    int a[] = {0, 1, 0, 3, 12, 0, 7};
    move_zeroes(a, 7);
    for (int i = 0; i < 7; i++) printf("%d ", a[i]);
    printf("\n");
    return 0;
}
