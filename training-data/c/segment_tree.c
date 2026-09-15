#include <stdio.h>

#define N 8

int tree[2 * N];

void build(int arr[]) {
    for (int i = 0; i < N; i++) tree[N + i] = arr[i];
    for (int i = N - 1; i > 0; i--) tree[i] = tree[2 * i] + tree[2 * i + 1];
}

void update(int pos, int value) {
    pos += N;
    tree[pos] = value;
    for (pos /= 2; pos >= 1; pos /= 2) {
        tree[pos] = tree[2 * pos] + tree[2 * pos + 1];
    }
}

int query(int l, int r) {
    int sum = 0;
    for (l += N, r += N + 1; l < r; l /= 2, r /= 2) {
        if (l & 1) sum += tree[l++];
        if (r & 1) sum += tree[--r];
    }
    return sum;
}

int main(void) {
    int arr[N] = {1, 3, 5, 7, 9, 11, 13, 15};
    build(arr);
    printf("%d\n", query(1, 5));
    update(2, 10);
    printf("%d\n", query(1, 5));
    return 0;
}
