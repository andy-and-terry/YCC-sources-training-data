#include <stdio.h>
#include <stdlib.h>

struct N { int v; struct N *next; };

static struct N *push(struct N *h, int v) {
    struct N *n = malloc(sizeof *n);
    n->v = v; n->next = h;
    return n;
}

static struct N *reverse(struct N *h) {
    struct N *p = NULL;
    while (h) { struct N *nx = h->next; h->next = p; p = h; h = nx; }
    return p;
}

int main(void) {
    struct N *l = NULL;
    for (int i = 1; i <= 4; i++) l = push(l, i);
    l = reverse(l);
    for (struct N *c = l; c; c = c->next) printf("%d ", c->v);
    putchar('\n');
    while (l) { struct N *t = l->next; free(l); l = t; }
    return 0;
}
