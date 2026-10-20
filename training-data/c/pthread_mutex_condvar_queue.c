#include <pthread.h>
#include <stdio.h>

static int q[8], n = 0, done = 0;
static pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
static pthread_cond_t c = PTHREAD_COND_INITIALIZER;

static void *consumer(void *arg) {
    long sum = 0;
    pthread_mutex_lock(&m);
    while (!done || n) {
        while (!n && !done) pthread_cond_wait(&c, &m);
        while (n) sum += q[--n];
    }
    pthread_mutex_unlock(&m);
    *(long *)arg = sum;
    return NULL;
}

int main(void) {
    pthread_t t;
    long total = 0;
    pthread_create(&t, NULL, consumer, &total);
    for (int i = 1; i <= 5; i++) {
        pthread_mutex_lock(&m); q[n++] = i; pthread_cond_signal(&c); pthread_mutex_unlock(&m);
    }
    pthread_mutex_lock(&m); done = 1; pthread_cond_broadcast(&c); pthread_mutex_unlock(&m);
    pthread_join(t, NULL);
    printf("%ld\n", total);
    return 0;
}
