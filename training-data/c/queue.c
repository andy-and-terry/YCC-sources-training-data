#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int value;
    struct Node *next;
} Node;

typedef struct {
    Node *head;
    Node *tail;
} Queue;

void enqueue(Queue *q, int value) {
    Node *node = malloc(sizeof(Node));
    node->value = value;
    node->next = NULL;
    if (q->tail) q->tail->next = node;
    else q->head = node;
    q->tail = node;
}

int dequeue(Queue *q) {
    if (!q->head) return -1;
    Node *node = q->head;
    int value = node->value;
    q->head = node->next;
    if (!q->head) q->tail = NULL;
    free(node);
    return value;
}

int main(void) {
    Queue q = {0};
    enqueue(&q, 1);
    enqueue(&q, 2);
    enqueue(&q, 3);
    printf("%d %d %d\n", dequeue(&q), dequeue(&q), dequeue(&q));
    return 0;
}
