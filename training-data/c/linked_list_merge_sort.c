#include <stdio.h>
#include <stdlib.h>

typedef struct Node { int v; struct Node *next; } Node;

static Node *push(Node *h, int v) {
    Node *n = malloc(sizeof *n);
    n->v = v; n->next = h;
    return n;
}

static Node *merge(Node *a, Node *b) {
    if (!a) return b;
    if (!b) return a;
    if (a->v <= b->v) { a->next = merge(a->next, b); return a; }
    b->next = merge(a, b->next);
    return b;
}

static Node *msort(Node *h) {
    if (!h || !h->next) return h;
    Node *slow = h, *fast = h->next;
    while (fast && fast->next) { slow = slow->next; fast = fast->next->next; }
    Node *second = slow->next;
    slow->next = NULL;
    return merge(msort(h), msort(second));
}

int main(void) {
    Node *h = NULL;
    int vals[] = {5, 2, 9, 1, 7, 3, 8};
    for (int i = 0; i < 7; i++) h = push(h, vals[i]);
    h = msort(h);
    for (Node *p = h; p; ) { printf("%d ", p->v); Node *t = p; p = p->next; free(t); }
    putchar('\n');
    return 0;
}
