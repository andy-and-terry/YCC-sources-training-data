#include <stddef.h>
#include <stdio.h>

#define container_of(ptr, type, member) ((type *)((char *)(ptr) - offsetof(type, member)))

struct Node { int value; struct { struct Node *next; } link; };

int main(void) {
    struct Node n = { 42, { NULL } };
    void *link = &n.link;
    struct Node *back = container_of(link, struct Node, link);
    printf("%d\n", back->value);
    return 0;
}
