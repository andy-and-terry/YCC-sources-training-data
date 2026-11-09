#include <stdio.h>

#define CAP 4
typedef struct { int buf[CAP]; int head, tail, count; } Ring;

static void push(Ring *r, int v) {
    r->buf[r->tail] = v;
    r->tail = (r->tail + 1) % CAP;
    if (r->count < CAP) r->count++; else r->head = (r->head + 1) % CAP;
}

int main(void) {
    Ring r = {0};
    for (int i = 1; i <= 6; i++) push(&r, i);
    for (int i = 0; i < r.count; i++) printf("%d ", r.buf[(r.head + i) % CAP]);
    putchar('\n');
    return 0;
}
