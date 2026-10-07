#include <stdio.h>
#include <signal.h>

volatile sig_atomic_t interrupted = 0;

void handle_sigint(int signum) {
    (void)signum;
    interrupted = 1;
}

int main(void) {
    signal(SIGINT, handle_sigint);

    printf("before signal: interrupted=%d\n", interrupted);

    /* Raise the signal ourselves so the demo is deterministic without
     * needing an interactive Ctrl-C from a terminal. */
    raise(SIGINT);

    printf("after signal: interrupted=%d\n", interrupted);

    if (interrupted) {
        printf("handled SIGINT gracefully, cleaning up and exiting\n");
    }
    return 0;
}
