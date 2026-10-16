#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Person { char name[16]; int age; };

static int by_age(const void *a, const void *b) {
    return ((const struct Person *)a)->age - ((const struct Person *)b)->age;
}

static int by_name(const void *a, const void *b) {
    return strcmp(((const struct Person *)a)->name, ((const struct Person *)b)->name);
}

int main(void) {
    struct Person p[] = {{"Zed", 31}, {"Amy", 44}, {"Bob", 23}};
    qsort(p, 3, sizeof p[0], by_age);
    for (int i = 0; i < 3; i++) printf("%s(%d) ", p[i].name, p[i].age);
    putchar('\n');
    qsort(p, 3, sizeof p[0], by_name);
    for (int i = 0; i < 3; i++) printf("%s(%d) ", p[i].name, p[i].age);
    putchar('\n');
    return 0;
}
