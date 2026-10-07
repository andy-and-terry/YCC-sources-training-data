#include <stdio.h>
#include <stdlib.h>

/* A double-ended queue backed by a doubly linked list, supporting O(1)
 * push/pop at both ends. */
typedef struct Node {
    int data;
    struct Node *prev;
    struct Node *next;
} Node;

typedef struct {
    Node *head;
    Node *tail;
} Deque;

void push_front(Deque *dq, int value) {
    Node *node = malloc(sizeof(Node));
    node->data = value;
    node->prev = NULL;
    node->next = dq->head;
    if (dq->head) dq->head->prev = node;
    else dq->tail = node;
    dq->head = node;
}

void push_back(Deque *dq, int value) {
    Node *node = malloc(sizeof(Node));
    node->data = value;
    node->next = NULL;
    node->prev = dq->tail;
    if (dq->tail) dq->tail->next = node;
    else dq->head = node;
    dq->tail = node;
}

int pop_front(Deque *dq) {
    Node *node = dq->head;
    int value = node->data;
    dq->head = node->next;
    if (dq->head) dq->head->prev = NULL;
    else dq->tail = NULL;
    free(node);
    return value;
}

int pop_back(Deque *dq) {
    Node *node = dq->tail;
    int value = node->data;
    dq->tail = node->prev;
    if (dq->tail) dq->tail->next = NULL;
    else dq->head = NULL;
    free(node);
    return value;
}

void print_deque(const Deque *dq) {
    for (Node *n = dq->head; n; n = n->next) printf("%d ", n->data);
    printf("\n");
}

int main(void) {
    Deque dq = {NULL, NULL};
    push_back(&dq, 2);
    push_back(&dq, 3);
    push_front(&dq, 1);
    push_front(&dq, 0);
    print_deque(&dq);

    printf("pop_front: %d\n", pop_front(&dq));
    printf("pop_back: %d\n", pop_back(&dq));
    print_deque(&dq);
    return 0;
}
