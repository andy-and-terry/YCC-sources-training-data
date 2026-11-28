#include <stdio.h>
#include <stdlib.h>

struct person { const char *name; int age; };

static int by_age(const void *a, const void *b) {
    const struct person *x = a, *y = b;
    return (x->age > y->age) - (x->age < y->age);
}

int main(void) {
    struct person p[] = { {"Ann", 31}, {"Bob", 25}, {"Cy", 40} };
    qsort(p, 3, sizeof p[0], by_age);
    for (int i = 0; i < 3; i++) printf("%s %d\n", p[i].name, p[i].age);
    return 0;
}
