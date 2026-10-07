#define _POSIX_C_SOURCE 200809L
#include <pthread.h>
#include <stdio.h>

int shared_value = 0;
pthread_rwlock_t lock = PTHREAD_RWLOCK_INITIALIZER;

void *reader(void *arg) {
    int id = *(int *)arg;
    pthread_rwlock_rdlock(&lock);
    printf("reader %d sees value %d\n", id, shared_value);
    pthread_rwlock_unlock(&lock);
    return NULL;
}

void *writer(void *arg) {
    (void)arg;
    pthread_rwlock_wrlock(&lock);
    shared_value += 10;
    printf("writer set value to %d\n", shared_value);
    pthread_rwlock_unlock(&lock);
    return NULL;
}

int main(void) {
    pthread_t w, r1, r2;
    pthread_create(&w, NULL, writer, NULL);
    pthread_join(w, NULL);

    int id1 = 1, id2 = 2;
    pthread_create(&r1, NULL, reader, &id1);
    pthread_create(&r2, NULL, reader, &id2);
    pthread_join(r1, NULL);
    pthread_join(r2, NULL);

    pthread_rwlock_destroy(&lock);
    return 0;
}
