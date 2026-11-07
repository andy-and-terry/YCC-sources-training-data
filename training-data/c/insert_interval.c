#include <stdio.h>

typedef struct { int lo, hi; } Interval;

static int insert_interval(const Interval *in, int n, Interval nw, Interval *out) {
    int i = 0, k = 0;
    while (i < n && in[i].hi < nw.lo) out[k++] = in[i++];
    while (i < n && in[i].lo <= nw.hi) {
        if (in[i].lo < nw.lo) nw.lo = in[i].lo;
        if (in[i].hi > nw.hi) nw.hi = in[i].hi;
        i++;
    }
    out[k++] = nw;
    while (i < n) out[k++] = in[i++];
    return k;
}

int main(void) {
    Interval in[] = {{1, 3}, {6, 9}}, out[3];
    int k = insert_interval(in, 2, (Interval){2, 5}, out);
    for (int i = 0; i < k; i++) printf("[%d,%d] ", out[i].lo, out[i].hi);
    printf("\n"); /* [1,5] [6,9] */
    return 0;
}
