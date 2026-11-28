#include <stdio.h>
#include <stdlib.h>

struct N { int v; struct N *next; };

static struct N *reverse(struct N *h) {
    struct N *prev = NULL;
    while (h) { struct N *n = h->next; h->next = prev; prev = h; h = n; }
    return prev;
}

int main(void) {
    struct N c = {3, NULL}, b = {2, &c}, a = {1, &b};
    for (struct N *p = reverse(&a); p; p = p->next) printf("%d ", p->v);
    putchar('\n');
    return 0;
}
