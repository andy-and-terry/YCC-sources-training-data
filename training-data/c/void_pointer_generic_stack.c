#include <stdio.h>
#include <stdlib.h>

typedef struct {
    void **items;
    int size;
    int capacity;
} Stack;

void stack_init(Stack *s, int capacity) {
    s->items = malloc(capacity * sizeof(void *));
    s->size = 0;
    s->capacity = capacity;
}

void stack_push(Stack *s, void *item) {
    s->items[s->size++] = item;
}

void *stack_pop(Stack *s) {
    return s->items[--s->size];
}

void stack_free(Stack *s) {
    free(s->items);
}

int main(void) {
    Stack s;
    stack_init(&s, 4);

    int a = 1, b = 2;
    const char *msg = "hello";

    stack_push(&s, &a);
    stack_push(&s, &b);
    stack_push(&s, (void *)msg);

    printf("%s\n", (const char *)stack_pop(&s));
    printf("%d\n", *(int *)stack_pop(&s));
    printf("%d\n", *(int *)stack_pop(&s));

    stack_free(&s);
    return 0;
}
