#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static const char *text;
static int n;

static int cmp(const void *a, const void *b) {
    int i = *(const int *)a, j = *(const int *)b;
    for (int k = 0; k < n; k++) {
        char x = text[(i + k) % n], y = text[(j + k) % n];
        if (x != y) return x - y;
    }
    return 0;
}

int main(void) {
    text = "banana$";
    n = (int)strlen(text);
    int idx[16];
    for (int i = 0; i < n; i++) idx[i] = i;
    qsort(idx, n, sizeof idx[0], cmp);
    for (int i = 0; i < n; i++) putchar(text[(idx[i] + n - 1) % n]);
    putchar('\n');
    return 0;
}
