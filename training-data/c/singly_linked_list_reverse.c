#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int value;
    struct Node *next;
} Node;

Node *reverse_list(Node *head) {
    Node *prev = NULL;
    while (head) {
        Node *next = head->next;
        head->next = prev;
        prev = head;
        head = next;
    }
    return prev;
}

int main(void) {
    Node *head = NULL;
    for (int i = 4; i >= 1; i--) {
        Node *node = malloc(sizeof(Node));
        node->value = i;
        node->next = head;
        head = node;
    }
    head = reverse_list(head);
    for (Node *cur = head; cur; cur = cur->next) printf("%d ", cur->value);
    printf("\n");
    return 0;
}
