#include <stdio.h>

#define N 6

int tree[N + 1];

void update(int i, int delta) {
    for (++i; i <= N; i += i & (-i)) tree[i] += delta;
}

int prefix_sum(int i) {
    int total = 0;
    for (++i; i > 0; i -= i & (-i)) total += tree[i];
    return total;
}

int range_sum(int l, int r) {
    return prefix_sum(r) - (l > 0 ? prefix_sum(l - 1) : 0);
}

int main(void) {
    int values[N] = {1, 3, 5, 7, 9, 11};
    for (int i = 0; i < N; i++) update(i, values[i]);
    printf("%d\n", range_sum(1, 3));
    update(1, 4);
    printf("%d\n", range_sum(1, 3));
    return 0;
}
