#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef int (*operation)(void *ctx);

static void sleep_ms(long ms) {
    struct timespec ts = {ms / 1000, (ms % 1000) * 1000000L};
    while (nanosleep(&ts, &ts) == -1 && errno == EINTR) {
    }
}

/* Retries op until it returns 0, with capped exponential backoff and full jitter. */
int retry(operation op, void *ctx, int max_attempts, long base_ms, long cap_ms) {
    for (int attempt = 1;; attempt++) {
        int rc = op(ctx);
        if (rc == 0 || attempt >= max_attempts) return rc;
        long ceiling = base_ms << attempt;
        if (ceiling > cap_ms) ceiling = cap_ms;
        long delay = rand() % (ceiling + 1);
        printf("attempt %d failed (rc=%d), sleeping %ldms\n", attempt, rc, delay);
        sleep_ms(delay);
    }
}

static int flaky(void *ctx) {
    int *calls = ctx;
    return ++*calls < 4 ? -1 : 0;
}

int main(void) {
    srand(7);
    int calls = 0;
    int rc = retry(flaky, &calls, 5, 10, 200);
    printf("rc=%d after %d calls\n", rc, calls);
    return 0;
}
