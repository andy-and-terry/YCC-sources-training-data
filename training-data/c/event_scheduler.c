#include <stdio.h>

#define MAXEV 64

typedef struct {
    double time;
    int seq, customer, kind; /* kind 0 = arrive, 1 = depart */
} event;

static event heap[MAXEV];
static int heap_size, seq_counter;

static int less(const event *a, const event *b) { return a->time < b->time || (a->time == b->time && a->seq < b->seq); }

static void push(double t, int customer, int kind) {
    int i = heap_size++;
    heap[i] = (event){t, seq_counter++, customer, kind};
    while (i > 0 && less(&heap[i], &heap[(i - 1) / 2])) {
        event tmp = heap[i];
        heap[i] = heap[(i - 1) / 2];
        heap[(i - 1) / 2] = tmp;
        i = (i - 1) / 2;
    }
}

static event pop(void) {
    event top = heap[0];
    heap[0] = heap[--heap_size];
    for (int i = 0;;) {
        int l = 2 * i + 1, r = l + 1, m = i;
        if (l < heap_size && less(&heap[l], &heap[m])) m = l;
        if (r < heap_size && less(&heap[r], &heap[m])) m = r;
        if (m == i) break;
        event tmp = heap[i];
        heap[i] = heap[m];
        heap[m] = tmp;
        i = m;
    }
    return top;
}

int main(void) {
    const double arrive[] = {0, 1, 1.5, 6}, service[] = {3, 2, 4, 1};
    double server_free = 0;
    for (int i = 0; i < 4; i++) push(arrive[i], i, 0);
    while (heap_size) {
        event e = pop();
        if (e.kind == 0) {
            double start = e.time > server_free ? e.time : server_free;
            server_free = start + service[e.customer];
            printf("t=%4.1f c%d arrives (starts at %.1f)\n", e.time, e.customer, start);
            push(server_free, e.customer, 1);
        } else {
            printf("t=%4.1f c%d departs\n", e.time, e.customer);
        }
    }
    return 0;
}
