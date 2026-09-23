#include <stdio.h>

typedef enum { STATE_RED, STATE_GREEN, STATE_YELLOW, STATE_COUNT } State;

typedef State (*Handler)(void);

static State handle_red(void) {
    printf("Red -> Green\n");
    return STATE_GREEN;
}

static State handle_green(void) {
    printf("Green -> Yellow\n");
    return STATE_YELLOW;
}

static State handle_yellow(void) {
    printf("Yellow -> Red\n");
    return STATE_RED;
}

/* A table of function pointers replaces a switch statement: adding a new
 * state only means adding a handler and a table entry. */
static Handler handlers[STATE_COUNT] = {handle_red, handle_green, handle_yellow};

int main(void) {
    State current = STATE_RED;
    for (int i = 0; i < 5; i++) {
        current = handlers[current]();
    }
    return 0;
}
