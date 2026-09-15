#include <stdio.h>
#include <stdlib.h>

typedef struct DNode {
    int data;
    struct DNode *prev;
    struct DNode *next;
} DNode;

typedef struct {
    DNode *head;
    DNode *tail;
} DoublyLinkedList;

void dll_init(DoublyLinkedList *list) {
    list->head = NULL;
    list->tail = NULL;
}

void dll_push_back(DoublyLinkedList *list, int value) {
    DNode *node = malloc(sizeof(DNode));
    node->data = value;
    node->prev = list->tail;
    node->next = NULL;
    if (list->tail) {
        list->tail->next = node;
    } else {
        list->head = node;
    }
    list->tail = node;
}

int dll_pop_front(DoublyLinkedList *list) {
    DNode *node = list->head;
    int value = node->data;
    list->head = node->next;
    if (list->head) {
        list->head->prev = NULL;
    } else {
        list->tail = NULL;
    }
    free(node);
    return value;
}

void dll_print_forward(const DoublyLinkedList *list) {
    for (DNode *cur = list->head; cur; cur = cur->next) {
        printf("%d ", cur->data);
    }
    printf("\n");
}

void dll_print_backward(const DoublyLinkedList *list) {
    for (DNode *cur = list->tail; cur; cur = cur->prev) {
        printf("%d ", cur->data);
    }
    printf("\n");
}

void dll_free(DoublyLinkedList *list) {
    DNode *cur = list->head;
    while (cur) {
        DNode *next = cur->next;
        free(cur);
        cur = next;
    }
    list->head = NULL;
    list->tail = NULL;
}

int main(void) {
    DoublyLinkedList list;
    dll_init(&list);
    dll_push_back(&list, 10);
    dll_push_back(&list, 20);
    dll_push_back(&list, 30);

    dll_print_forward(&list);
    dll_print_backward(&list);

    printf("popped: %d\n", dll_pop_front(&list));
    dll_print_forward(&list);

    dll_free(&list);
    return 0;
}
