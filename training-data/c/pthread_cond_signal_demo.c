#include <pthread.h>
#include <stdio.h>

static pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
static pthread_cond_t cv = PTHREAD_COND_INITIALIZER;
static int ready = 0;

static void *waiter(void *arg) {
    (void)arg;
    pthread_mutex_lock(&m);
    while (!ready)                 /* guard against spurious wakeups */
        pthread_cond_wait(&cv, &m);
    printf("waiter: got signal\n");
    pthread_mutex_unlock(&m);
    return NULL;
}

int main(void) {
    pthread_t t;
    pthread_create(&t, NULL, waiter, NULL);
    pthread_mutex_lock(&m);
    ready = 1;
    pthread_cond_signal(&cv);
    pthread_mutex_unlock(&m);
    pthread_join(t, NULL);
    return 0;
}
