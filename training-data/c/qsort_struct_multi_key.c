#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct { const char *name; int age; } Person;

static int cmp(const void *a, const void *b) {
    const Person *p = a, *q = b;
    if (p->age != q->age) return q->age - p->age;   /* age descending */
    return strcmp(p->name, q->name);                /* then name ascending */
}

int main(void) {
    Person ps[] = {{"Bob", 30}, {"Alice", 30}, {"Carol", 25}, {"Dave", 41}};
    qsort(ps, 4, sizeof ps[0], cmp);
    for (int i = 0; i < 4; i++) printf("%s %d\n", ps[i].name, ps[i].age);
    return 0;
}
