#include <stddef.h>
#include <stdio.h>

#define container_of(ptr, type, member) \
    ((type *)((char *)(ptr) - offsetof(type, member)))

struct node { int id; int link; };

int main(void) {
    struct node n = { 7, 0 };
    struct node *p = container_of(&n.link, struct node, link);
    printf("%d\n", p->id);
    return 0;
}
