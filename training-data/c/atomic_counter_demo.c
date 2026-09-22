#include <stdio.h>
#include <pthread.h>
#include <stdatomic.h>

#define NUM_THREADS 8
#define INCREMENTS_PER_THREAD 100000

atomic_int counter = 0;

void *worker(void *arg) {
    (void)arg;
    for (int i = 0; i < INCREMENTS_PER_THREAD; i++) {
        atomic_fetch_add_explicit(&counter, 1, memory_order_relaxed);
    }
    return NULL;
}

int main(void) {
    pthread_t threads[NUM_THREADS];

    for (int i = 0; i < NUM_THREADS; i++) {
        pthread_create(&threads[i], NULL, worker, NULL);
    }
    for (int i = 0; i < NUM_THREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    printf("final counter = %d (expected %d)\n",
           atomic_load(&counter), NUM_THREADS * INCREMENTS_PER_THREAD);
    return 0;
}
