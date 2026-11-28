#include <stdio.h>

#define N 4
typedef struct { int buf[N]; int head, count; } Ring;

static void push(Ring *r, int v) {
    r->buf[(r->head + r->count) % N] = v;
    if (r->count < N) r->count++; else r->head = (r->head + 1) % N;
}

int main(void) {
    Ring r = {0};
    for (int i = 1; i <= 6; i++) push(&r, i);
    for (int i = 0; i < r.count; i++) printf("%d ", r.buf[(r.head + i) % N]);
    putchar('\n');
    return 0;
}
