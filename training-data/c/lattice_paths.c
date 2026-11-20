#include <stdio.h>
/* Lattice paths with a rolling DP row. */
static long lattice(int n) {
    long row[32];
    for (int j = 0; j <= n; j++) row[j] = 1;
    for (int k = 0; k < n; k++) for (int j = 1; j <= n; j++) row[j] += row[j - 1];
    return row[n];
}
int main(void) { printf("%ld\n", lattice(3)); return 0; }
