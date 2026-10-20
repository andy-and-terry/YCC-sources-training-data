#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct person { char name[16]; int age; };

static int by_age_then_name(const void *a, const void *b) {
    const struct person *x = a, *y = b;
    if (x->age != y->age) return (x->age > y->age) - (x->age < y->age);
    return strcmp(x->name, y->name);
}

int main(void) {
    struct person p[] = {{"Zoe", 30}, {"Al", 25}, {"Bea", 30}};
    qsort(p, 3, sizeof p[0], by_age_then_name);
    for (int i = 0; i < 3; i++) printf("%s %d\n", p[i].name, p[i].age);
    return 0;
}
