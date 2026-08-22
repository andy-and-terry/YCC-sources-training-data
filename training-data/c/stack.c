#include <stdio.h>

#define MAX_SIZE 100

typedef struct {
    int items[MAX_SIZE];
    int top;
} Stack;

void stack_init(Stack *s) {
    s->top = -1;
}

void stack_push(Stack *s, int value) {
    s->items[++s->top] = value;
}

int stack_pop(Stack *s) {
    return s->items[s->top--];
}

int stack_is_empty(Stack *s) {
    return s->top < 0;
}

int main(void) {
    Stack s;
    stack_init(&s);
    stack_push(&s, 1);
    stack_push(&s, 2);
    stack_push(&s, 3);
    printf("%d %d\n", stack_pop(&s), stack_is_empty(&s));
    return 0;
}
