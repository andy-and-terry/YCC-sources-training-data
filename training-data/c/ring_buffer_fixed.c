#include <stdio.h>
#include <stdbool.h>

#define CAP 4

typedef struct { int buf[CAP]; int head, tail, count; } Ring;

static bool push(Ring *r, int v) {
    if (r->count == CAP) return false;
    r->buf[r->tail] = v;
    r->tail = (r->tail + 1) % CAP;
    r->count++;
    return true;
}

static bool pop(Ring *r, int *out) {
    if (r->count == 0) return false;
    *out = r->buf[r->head];
    r->head = (r->head + 1) % CAP;
    r->count--;
    return true;
}

int main(void) {
    Ring r = {0};
    for (int i = 1; i <= 5; i++) printf("push %d: %d\n", i, push(&r, i));
    int v;
    while (pop(&r, &v)) printf("pop %d\n", v);
    return 0;
}
