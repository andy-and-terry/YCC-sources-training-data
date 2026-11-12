#include <stdio.h>
#include <stdlib.h>
#include <string.h>
static int cmp(const void *a, const void *b) { return strcmp(*(const char **)a, *(const char **)b); }
int main(void) {
    const char *w[] = { "pear", "apple", "fig", "kiwi" };
    qsort(w, 4, sizeof w[0], cmp);
    const char *key = "fig";
    const char **hit = bsearch(&key, w, 4, sizeof w[0], cmp);
    printf("%s at %ld\n", *hit, (long)(hit - w));
    return 0;
}
