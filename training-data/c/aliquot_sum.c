#include <stdio.h>
/* Aliquot sum classification. */
static int aliquot(int n) { int s = 0; for (int d = 1; d < n; d++) if (n % d == 0) s += d; return s; }
int main(void) {
    int v[] = {6, 12, 15, 28};
    for (int i = 0; i < 4; i++) {
        int a = aliquot(v[i]);
        printf("%d %d %s\n", v[i], a, a == v[i] ? "perfect" : a > v[i] ? "abundant" : "deficient");
    }
    return 0;
}
