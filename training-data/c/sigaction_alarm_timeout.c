#define _POSIX_C_SOURCE 200809L
#include <errno.h>
#include <signal.h>
#include <stdio.h>
#include <unistd.h>

static volatile sig_atomic_t timed_out = 0;

static void on_alarm(int sig) {
    (void)sig;
    timed_out = 1;
}

int main(void) {
    struct sigaction sa;
    sa.sa_handler = on_alarm;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = 0;                 /* no SA_RESTART: let blocking calls fail with EINTR */
    if (sigaction(SIGALRM, &sa, NULL) == -1) {
        perror("sigaction");
        return 1;
    }

    int fds[2];
    if (pipe(fds) == -1) { perror("pipe"); return 1; }

    alarm(1);                        /* nobody writes to the pipe */
    char c;
    ssize_t n = read(fds[0], &c, 1);
    if (n == -1 && errno == EINTR && timed_out)
        puts("read timed out after alarm");
    else
        puts("read returned unexpectedly");

    close(fds[0]);
    close(fds[1]);
    return 0;
}
