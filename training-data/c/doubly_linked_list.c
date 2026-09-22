#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node *prev;
    struct Node *next;
} Node;

typedef struct {
    Node *head;
    Node *tail;
} DList;

void push_back(DList *list, int value) {
    Node *node = malloc(sizeof(Node));
    node->data = value;
    node->next = NULL;
    node->prev = list->tail;

    if (list->tail) {
        list->tail->next = node;
    } else {
        list->head = node;
    }
    list->tail = node;
}

void remove_node(DList *list, Node *node) {
    if (node->prev) node->prev->next = node->next;
    else list->head = node->next;

    if (node->next) node->next->prev = node->prev;
    else list->tail = node->prev;

    free(node);
}

void print_forward(const DList *list) {
    for (Node *n = list->head; n; n = n->next) printf("%d ", n->data);
    printf("\n");
}

void print_backward(const DList *list) {
    for (Node *n = list->tail; n; n = n->prev) printf("%d ", n->data);
    printf("\n");
}

int main(void) {
    DList list = {NULL, NULL};
    push_back(&list, 1);
    push_back(&list, 2);
    push_back(&list, 3);
    push_back(&list, 4);

    print_forward(&list);
    print_backward(&list);

    remove_node(&list, list.head->next);
    print_forward(&list);

    Node *n;
    while ((n = list.head)) remove_node(&list, n);
    return 0;
}
