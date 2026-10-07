#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int *buf;
    size_t cap, head, size;
} deque;

static void dq_grow(deque *d) {
    size_t ncap = d->cap ? d->cap * 2 : 4;
    int *nb = malloc(ncap * sizeof *nb);
    for (size_t i = 0; i < d->size; i++) nb[i] = d->buf[(d->head + i) % d->cap];
    free(d->buf);
    d->buf = nb;
    d->cap = ncap;
    d->head = 0;
}

void dq_push_back(deque *d, int x) {
    if (d->size == d->cap) dq_grow(d);
    d->buf[(d->head + d->size++) % d->cap] = x;
}

void dq_push_front(deque *d, int x) {
    if (d->size == d->cap) dq_grow(d);
    d->head = (d->head + d->cap - 1) % d->cap;
    d->buf[d->head] = x;
    d->size++;
}

int dq_pop_front(deque *d) {
    int x = d->buf[d->head];
    d->head = (d->head + 1) % d->cap;
    d->size--;
    return x;
}

int dq_pop_back(deque *d) {
    d->size--;
    return d->buf[(d->head + d->size) % d->cap];
}

int main(void) {
    deque d = {0};
    for (int i = 0; i < 5; i++) {
        dq_push_back(&d, i);
        dq_push_front(&d, -i);
    }
    for (size_t i = 0; i < d.size; i++) printf("%d ", d.buf[(d.head + i) % d.cap]);
    int front = dq_pop_front(&d);
    int back = dq_pop_back(&d);
    printf("\nfront=%d back=%d size=%zu\n", front, back, d.size);
    free(d.buf);
    return 0;
}
