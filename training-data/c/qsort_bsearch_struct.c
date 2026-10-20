#include <stdio.h>
#include <stdlib.h>

struct Item { int id; const char *name; };

static int by_id(const void *a, const void *b) {
    return ((const struct Item *)a)->id - ((const struct Item *)b)->id;
}

int main(void) {
    struct Item v[] = { {5, "e"}, {2, "b"}, {9, "i"}, {1, "a"} };
    qsort(v, 4, sizeof v[0], by_id);
    struct Item key = { 5, NULL };
    struct Item *hit = bsearch(&key, v, 4, sizeof v[0], by_id);
    printf("%s %ld\n", hit ? hit->name : "none", hit ? (long)(hit - v) : -1L);
    return 0;
}
