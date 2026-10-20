#include <stdio.h>
#include <stdlib.h>

struct Node { int v; struct Node *next; };

static void insert_sorted(struct Node **head, int v) {
    struct Node **pp = head;
    while (*pp && (*pp)->v < v) pp = &(*pp)->next;
    struct Node *n = malloc(sizeof *n);
    n->v = v; n->next = *pp; *pp = n;
}

static void remove_val(struct Node **head, int v) {
    for (struct Node **pp = head; *pp; pp = &(*pp)->next)
        if ((*pp)->v == v) { struct Node *d = *pp; *pp = d->next; free(d); return; }
}

int main(void) {
    struct Node *h = NULL;
    int xs[] = {5, 1, 3, 4};
    for (int i = 0; i < 4; i++) insert_sorted(&h, xs[i]);
    remove_val(&h, 3);
    for (struct Node *n = h; n; n = n->next) printf("%d ", n->v);
    printf("\n");
    while (h) { struct Node *n = h->next; free(h); h = n; }
    return 0;
}
