#include <stdio.h>
#include <stdlib.h>

typedef struct N { int v; struct N *next; } N;

static N *reverse(N *h) {
    N *prev = NULL;
    while (h) { N *nx = h->next; h->next = prev; prev = h; h = nx; }
    return prev;
}

int main(void) {
    N *h = NULL;
    for (int i = 3; i >= 1; i--) { N *n = malloc(sizeof *n); n->v = i; n->next = h; h = n; }
    h = reverse(h);
    for (N *p = h; p; p = p->next) printf("%d ", p->v);
    putchar('\n');
    while (h) { N *n = h->next; free(h); h = n; }
    return 0;
}
