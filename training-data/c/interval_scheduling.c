#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int start, end;
} interval;

static int by_end(const void *a, const void *b) {
    return ((const interval *)a)->end - ((const interval *)b)->end;
}

static int cmp_int(const void *a, const void *b) { return *(const int *)a - *(const int *)b; }

int max_non_overlapping(interval *iv, int n) {
    qsort(iv, (size_t)n, sizeof *iv, by_end);
    int count = 0, end = -1;
    for (int i = 0; i < n; i++) {
        if (iv[i].start >= end) {
            printf("[%d,%d) ", iv[i].start, iv[i].end);
            end = iv[i].end;
            count++;
        }
    }
    printf("\n");
    return count;
}

int min_rooms(const interval *iv, int n) {
    int starts[64], ends[64];
    for (int i = 0; i < n; i++) {
        starts[i] = iv[i].start;
        ends[i] = iv[i].end;
    }
    qsort(starts, (size_t)n, sizeof(int), cmp_int);
    qsort(ends, (size_t)n, sizeof(int), cmp_int);
    int rooms = 0, best = 0, j = 0;
    for (int i = 0; i < n; i++) {
        while (ends[j] <= starts[i]) {
            j++;
            rooms--;
        }
        if (++rooms > best) best = rooms;
    }
    return best;
}

int main(void) {
    interval iv[] = {{1, 4}, {3, 5}, {0, 6}, {5, 7}, {3, 9}, {5, 9}, {6, 10}, {8, 11}, {8, 12}, {2, 14}, {12, 16}};
    int n = sizeof iv / sizeof iv[0];
    printf("rooms needed: %d\n", min_rooms(iv, n));
    printf("max compatible: %d\n", max_non_overlapping(iv, n));
    return 0;
}
