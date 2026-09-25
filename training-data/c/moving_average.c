#include <stdio.h>

#define WINDOW 3

typedef struct {
    double buf[WINDOW], sum;
    int head, count;
} sma;

double sma_add(sma *s, double x) {
    if (s->count == WINDOW) s->sum -= s->buf[s->head];
    else s->count++;
    s->buf[s->head] = x;
    s->head = (s->head + 1) % WINDOW;
    s->sum += x;
    return s->sum / s->count;
}

int main(void) {
    const double prices[] = {10, 11, 12, 13, 12, 11, 15, 18, 17, 16};
    sma s = {{0}, 0, 0, 0};
    double ema = prices[0];
    for (int i = 0; i < 10; i++) {
        if (i) ema = 0.5 * prices[i] + 0.5 * ema;
        printf("%5.1f  sma=%7.3f  ema=%7.3f\n", prices[i], sma_add(&s, prices[i]), ema);
    }
    return 0;
}
