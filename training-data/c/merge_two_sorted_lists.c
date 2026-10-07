#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int val;
    struct node *next;
} node;

static node *push_front(node *head, int v) {
    node *n = malloc(sizeof *n);
    n->val = v;
    n->next = head;
    return n;
}

static node *from_array(const int *a, int n) {
    node *head = NULL;
    for (int i = n - 1; i >= 0; i--) head = push_front(head, a[i]);
    return head;
}

/* Uses a pointer-to-pointer tail to avoid a dummy node. */
node *merge(node *a, node *b) {
    node *head = NULL, **tail = &head;
    while (a && b) {
        node **smaller = a->val <= b->val ? &a : &b;
        *tail = *smaller;
        tail = &(*smaller)->next;
        *smaller = (*smaller)->next;
    }
    *tail = a ? a : b;
    return head;
}

int main(void) {
    int x[] = {1, 2, 4, 9}, y[] = {1, 3, 4, 5, 10};
    node *m = merge(from_array(x, 4), from_array(y, 5));
    while (m) {
        node *next = m->next;
        printf("%d ", m->val);
        free(m);
        m = next;
    }
    printf("\n");
    return 0;
}
