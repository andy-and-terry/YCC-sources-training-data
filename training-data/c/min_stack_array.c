#include <stdio.h>

#define CAP 64

typedef struct {
    int val[CAP];
    int min[CAP];
    int top;
} MinStack;

void push(MinStack *s, int x) {
    int m = (s->top > 0 && s->min[s->top - 1] < x) ? s->min[s->top - 1] : x;
    s->val[s->top] = x;
    s->min[s->top++] = m;
}

int pop(MinStack *s) { return s->val[--s->top]; }
int current_min(const MinStack *s) { return s->min[s->top - 1]; }

int main(void) {
    MinStack s = {.top = 0};
    int xs[] = {5, 3, 7, 2};
    for (int i = 0; i < 4; i++) push(&s, xs[i]);
    printf("%d\n", current_min(&s));
    pop(&s);
    printf("%d\n", current_min(&s));
    return 0;
}
