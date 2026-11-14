#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct P { const char *name; int age; };

static int by_age_then_name(const void *a, const void *b) {
    const struct P *x = a, *y = b;
    if (x->age != y->age) return x->age - y->age;
    return strcmp(x->name, y->name);
}

int main(void) {
    struct P ps[] = {{"Zed", 30}, {"Amy", 30}, {"Bob", 25}};
    qsort(ps, 3, sizeof ps[0], by_age_then_name);
    for (int i = 0; i < 3; i++) printf("%s %d\n", ps[i].name, ps[i].age);
    return 0;
}
