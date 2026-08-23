#include <stdio.h>

#define CAP 3

int buffer[CAP];
int head = 0, count = 0;

void cb_add(int value) {
    int tail = (head + count) % CAP;
    buffer[tail] = value;
    if (count < CAP) count++;
    else head = (head + 1) % CAP;
}

int main(void) {
    for (int i = 1; i <= 5; i++) cb_add(i);
    for (int i = 0; i < count; i++) {
        printf("%d ", buffer[(head + i) % CAP]);
    }
    printf("\n");
    return 0;
}
