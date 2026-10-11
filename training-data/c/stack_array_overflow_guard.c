#include <stdio.h>
#include <stdbool.h>

#define CAP 4

typedef struct { int data[CAP]; int top; } Stack;

static bool push(Stack *s, int v) {
    if (s->top == CAP) return false;
    s->data[s->top++] = v;
    return true;
}

static bool pop(Stack *s, int *out) {
    if (s->top == 0) return false;
    *out = s->data[--s->top];
    return true;
}

int main(void) {
    Stack s = {.top = 0};
    for (int i = 1; i <= 6; i++)
        printf("push %d: %s\n", i, push(&s, i * 10) ? "ok" : "full");
    int v;
    while (pop(&s, &v)) printf("pop %d\n", v);
    return 0;
}
