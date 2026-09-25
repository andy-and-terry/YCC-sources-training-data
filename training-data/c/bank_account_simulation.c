#include <pthread.h>
#include <stdio.h>

#define ACCOUNTS 4
#define THREADS 8
#define TRANSFERS 20000

typedef struct {
    long balance;
    pthread_mutex_t lock;
} account;

static account accts[ACCOUNTS];

/* Always lock the lower-numbered account first to avoid deadlock. */
static int transfer(int from, int to, long amount) {
    if (from == to) return 0;
    int a = from < to ? from : to, b = from < to ? to : from;
    pthread_mutex_lock(&accts[a].lock);
    pthread_mutex_lock(&accts[b].lock);
    int ok = accts[from].balance >= amount;
    if (ok) {
        accts[from].balance -= amount;
        accts[to].balance += amount;
    }
    pthread_mutex_unlock(&accts[b].lock);
    pthread_mutex_unlock(&accts[a].lock);
    return ok;
}

static void *worker(void *arg) {
    unsigned seed = (unsigned)(size_t)arg;
    for (int i = 0; i < TRANSFERS; i++) {
        seed = seed * 1103515245u + 12345u;
        transfer((int)(seed >> 8) % ACCOUNTS, (int)(seed >> 16) % ACCOUNTS, (long)(seed >> 24) % 50);
    }
    return NULL;
}

int main(void) {
    for (int i = 0; i < ACCOUNTS; i++) {
        accts[i].balance = 1000;
        pthread_mutex_init(&accts[i].lock, NULL);
    }
    pthread_t th[THREADS];
    for (int i = 0; i < THREADS; i++) pthread_create(&th[i], NULL, worker, (void *)(size_t)(i + 1));
    for (int i = 0; i < THREADS; i++) pthread_join(th[i], NULL);
    long total = 0;
    for (int i = 0; i < ACCOUNTS; i++) {
        printf("account %d: %ld\n", i, accts[i].balance);
        total += accts[i].balance;
        pthread_mutex_destroy(&accts[i].lock);
    }
    printf("total %ld (expected %d)\n", total, ACCOUNTS * 1000);
    return 0;
}
