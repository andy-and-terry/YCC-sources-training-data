#include <stdio.h>
#include <stdlib.h>

struct node { int v; struct node *next; };

static struct node *push(struct node *head, int v) {
    struct node *n = malloc(sizeof *n);
    n->v = v; n->next = head;
    return n;
}

static struct node *reverse(struct node *head) {
    struct node *prev = NULL;
    while (head) {
        struct node *next = head->next;
        head->next = prev;
        prev = head;
        head = next;
    }
    return prev;
}

int main(void) {
    struct node *h = NULL;
    for (int i = 1; i <= 4; i++) h = push(h, i);
    h = reverse(h);
    while (h) { struct node *n = h->next; printf("%d ", h->v); free(h); h = n; }
    putchar('\n');
    return 0;
}
