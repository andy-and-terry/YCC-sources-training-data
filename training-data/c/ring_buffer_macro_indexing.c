#include <stdio.h>

#define RB_SIZE 4
#define RB_NEXT(i) (((i) + 1) % RB_SIZE)

struct Ring { int buf[RB_SIZE]; int head, tail, count; };

static int push(struct Ring *r, int v) {
    if (r->count == RB_SIZE) return 0;
    r->buf[r->tail] = v; r->tail = RB_NEXT(r->tail); r->count++;
    return 1;
}

static int pop(struct Ring *r, int *out) {
    if (!r->count) return 0;
    *out = r->buf[r->head]; r->head = RB_NEXT(r->head); r->count--;
    return 1;
}

int main(void) {
    struct Ring r = {0};
    for (int i = 1; i <= 5; i++) printf("push %d -> %d\n", i, push(&r, i));
    int v;
    while (pop(&r, &v)) printf("%d ", v);
    printf("\n");
    return 0;
}
