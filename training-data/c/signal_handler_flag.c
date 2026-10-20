#include <signal.h>
#include <stdio.h>

static volatile sig_atomic_t got = 0;
static void handler(int sig) { got = sig; }

int main(void) {
    signal(SIGINT, handler);
    raise(SIGINT);
    printf("caught %d\n", got);
    return 0;
}
