#include <pthread.h>
#include <stdio.h>

#define CAP 4
#define ITEMS 8

int buffer[CAP];
int count = 0, in = 0, out = 0;
pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t not_full = PTHREAD_COND_INITIALIZER;
pthread_cond_t not_empty = PTHREAD_COND_INITIALIZER;

void *producer(void *arg) {
    (void)arg;
    for (int i = 1; i <= ITEMS; i++) {
        pthread_mutex_lock(&lock);
        while (count == CAP) pthread_cond_wait(&not_full, &lock);
        buffer[in] = i;
        in = (in + 1) % CAP;
        count++;
        pthread_cond_signal(&not_empty);
        pthread_mutex_unlock(&lock);
    }
    return NULL;
}

void *consumer(void *arg) {
    (void)arg;
    int sum = 0;
    for (int i = 0; i < ITEMS; i++) {
        pthread_mutex_lock(&lock);
        while (count == 0) pthread_cond_wait(&not_empty, &lock);
        sum += buffer[out];
        out = (out + 1) % CAP;
        count--;
        pthread_cond_signal(&not_full);
        pthread_mutex_unlock(&lock);
    }
    printf("%d\n", sum);
    return NULL;
}

int main(void) {
    pthread_t p, c;
    pthread_create(&p, NULL, producer, NULL);
    pthread_create(&c, NULL, consumer, NULL);
    pthread_join(p, NULL);
    pthread_join(c, NULL);
    return 0;
}
