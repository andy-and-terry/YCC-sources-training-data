#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int val;
    struct node *next;
} node;

node *cycle_start(node *head) {
    node *slow = head, *fast = head;
    while (fast && fast->next) {
        slow = slow->next;
        fast = fast->next->next;
        if (slow == fast) {
            slow = head;
            while (slow != fast) {
                slow = slow->next;
                fast = fast->next;
            }
            return slow;
        }
    }
    return NULL;
}

int main(void) {
    node nodes[6];
    for (int i = 0; i < 6; i++) {
        nodes[i].val = i * 10;
        nodes[i].next = i < 5 ? &nodes[i + 1] : NULL;
    }
    printf("no loop: %s\n", cycle_start(&nodes[0]) ? "cycle" : "none");
    nodes[5].next = &nodes[2];
    node *s = cycle_start(&nodes[0]);
    printf("loop starts at value %d\n", s ? s->val : -1);
    return 0;
}
