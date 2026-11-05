#include <stdio.h>
#include <stdlib.h>

struct P { const char *name; int age; };

static int by_age(const void *a, const void *b) {
    return ((const struct P *)a)->age - ((const struct P *)b)->age;
}

int main(void) {
    struct P ps[] = {{"ann", 31}, {"bob", 25}, {"cy", 40}};
    qsort(ps, 3, sizeof ps[0], by_age);
    for (int i = 0; i < 3; i++)
        printf("%s %d\n", ps[i].name, ps[i].age);
    return 0;
}
