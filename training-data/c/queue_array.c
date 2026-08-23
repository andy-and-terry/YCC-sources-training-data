#include <stdio.h>

#define CAP 10

int items[CAP];
int head = 0, tail = 0;

void enqueue(int value) {
    items[tail++] = value;
}

int dequeue(void) {
    return items[head++];
}

int main(void) {
    enqueue(1);
    enqueue(2);
    enqueue(3);
    int a = dequeue();
    int b = dequeue();
    int c = dequeue();
    printf("%d %d %d\n", a, b, c);
    return 0;
}
