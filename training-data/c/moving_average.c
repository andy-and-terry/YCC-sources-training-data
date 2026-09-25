#include <stdio.h>
#include <stdlib.h>

typedef struct {
    double *buf;
    int size, idx, count;
    double sum;
} moving_avg;

moving_avg *ma_new(int size) {
    moving_avg *m = calloc(1, sizeof *m);
    m->buf = calloc((size_t)size, sizeof *m->buf);
    m->size = size;
    return m;
}

double ma_next(moving_avg *m, double v) {
    m->sum += v - m->buf[m->idx];
    m->buf[m->idx] = v;
    m->idx = (m->idx + 1) % m->size;
    if (m->count < m->size) m->count++;
    return m->sum / m->count;
}

void ma_free(moving_avg *m) { free(m->buf); free(m); }

int main(void) {
    moving_avg *m = ma_new(3);
    double vals[] = {1, 10, 3, 5, 8, 2};
    for (int i = 0; i < 6; i++) printf("%.2f ", ma_next(m, vals[i]));
    putchar('\n');
    ma_free(m);
    return 0;
}
