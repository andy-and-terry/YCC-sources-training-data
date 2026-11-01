#include <stdio.h>
#include <stdlib.h>

struct P { const char *name; int age; };

static int cmp(const void *a, const void *b) {
    const struct P *x = a, *y = b;
    return (x->age > y->age) - (x->age < y->age);
}

int main(void) {
    struct P ps[] = { {"a", 30}, {"b", 20}, {"c", 25} };
    qsort(ps, 3, sizeof ps[0], cmp);
    for (int i = 0; i < 3; i++) printf("%s %d\n", ps[i].name, ps[i].age);
    return 0;
}
