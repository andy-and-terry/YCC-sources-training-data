#include <pthread.h>
#include <stdio.h>

typedef struct {
    pthread_mutex_t lock;
    long balance;
} account;

void deposit(account *a, long n) {
    pthread_mutex_lock(&a->lock);
    a->balance += n;
    pthread_mutex_unlock(&a->lock);
}

int withdraw(account *a, long n) {
    int ok = 0;
    pthread_mutex_lock(&a->lock);
    if (n <= a->balance) { a->balance -= n; ok = 1; }
    pthread_mutex_unlock(&a->lock);
    return ok;
}

static void *worker(void *arg) {
    for (int i = 0; i < 1000; i++) deposit(arg, 1);
    return NULL;
}

int main(void) {
    account a = {PTHREAD_MUTEX_INITIALIZER, 0};
    pthread_t t[8];
    for (int i = 0; i < 8; i++) pthread_create(&t[i], NULL, worker, &a);
    for (int i = 0; i < 8; i++) pthread_join(t[i], NULL);
    printf("balance=%ld withdraw_ok=%d\n", a.balance, withdraw(&a, 100000));
    return 0;
}
