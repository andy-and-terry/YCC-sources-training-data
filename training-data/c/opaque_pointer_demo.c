#include <stdio.h>
#include <stdlib.h>

/* Forward-declared incomplete type: callers only ever see a Counter*,
 * never its layout, so the representation below can change freely. */
typedef struct Counter Counter;

Counter *counter_create(int start);
void counter_increment(Counter *c);
int counter_value(const Counter *c);
void counter_destroy(Counter *c);

int main(void) {
    Counter *c = counter_create(10);
    counter_increment(c);
    counter_increment(c);
    printf("value=%d\n", counter_value(c));
    counter_destroy(c);
    return 0;
}

/* Definition hidden below main(): code above compiles against the
 * opaque pointer alone, exactly as it would from a separate header. */
struct Counter {
    int value;
};

Counter *counter_create(int start) {
    Counter *c = malloc(sizeof(Counter));
    if (c) c->value = start;
    return c;
}

void counter_increment(Counter *c) {
    c->value++;
}

int counter_value(const Counter *c) {
    return c->value;
}

void counter_destroy(Counter *c) {
    free(c);
}
