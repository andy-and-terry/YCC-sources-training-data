#include <pthread.h>
#include <stdatomic.h>
#include <stdio.h>

static atomic_int counter;

static void *work(void *a) { for (int i = 0; i < 10000; i++) atomic_fetch_add(&counter, 1); return a; }

int main(void) {
    pthread_t t[4];
    for (int i = 0; i < 4; i++) pthread_create(&t[i], NULL, work, NULL);
    for (int i = 0; i < 4; i++) pthread_join(t[i], NULL);
    printf("%d\n", atomic_load(&counter));
    return 0;
}
