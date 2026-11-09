#include <signal.h>
#include <stdio.h>
#include <unistd.h>

static volatile sig_atomic_t got_signal = 0;
static void handler(int sig) { (void)sig; got_signal = 1; }

int main(void) {
    signal(SIGINT, handler);
    raise(SIGINT);
    printf("signal flag: %d\n", (int)got_signal);
    return 0;
}
