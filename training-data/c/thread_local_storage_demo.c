#include <pthread.h>
#include <stdio.h>

static _Thread_local int tls_counter = 0;
static int shared_counter = 0;
static pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;

static void *worker(void *arg) {
    int id = *(int *)arg;
    for (int i = 0; i < id * 1000; i++) {
        tls_counter++;                       /* private to this thread, no lock */
        pthread_mutex_lock(&lock);
        shared_counter++;                    /* shared, needs the lock */
        pthread_mutex_unlock(&lock);
    }
    printf("thread %d: tls_counter=%d\n", id, tls_counter);
    return NULL;
}

int main(void) {
    pthread_t threads[3];
    int ids[3] = {1, 2, 3};

    for (int i = 0; i < 3; i++)
        pthread_create(&threads[i], NULL, worker, &ids[i]);
    for (int i = 0; i < 3; i++)
        pthread_join(threads[i], NULL);

    printf("main:     tls_counter=%d (untouched)\n", tls_counter);
    printf("shared_counter=%d\n", shared_counter);
    return 0;
}
