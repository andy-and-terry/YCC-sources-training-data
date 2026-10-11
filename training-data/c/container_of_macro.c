#include <stdio.h>
#include <stddef.h>

#define container_of(ptr, type, member) \
    ((type *)((char *)(ptr) - offsetof(type, member)))

struct ListNode { struct ListNode *next; };

struct Task {
    int id;
    struct ListNode link;
};

int main(void) {
    struct Task t = {.id = 77};
    struct ListNode *n = &t.link;
    struct Task *back = container_of(n, struct Task, link);
    printf("recovered id = %d (same object: %s)\n", back->id, back == &t ? "yes" : "no");
    return 0;
}
