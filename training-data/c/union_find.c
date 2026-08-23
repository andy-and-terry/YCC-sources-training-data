#include <stdio.h>

int parent[6];
int rank_[6];

int find(int x) {
    if (parent[x] != x) parent[x] = find(parent[x]);
    return parent[x];
}

void union_sets(int a, int b) {
    int ra = find(a), rb = find(b);
    if (ra == rb) return;
    if (rank_[ra] < rank_[rb]) parent[ra] = rb;
    else if (rank_[ra] > rank_[rb]) parent[rb] = ra;
    else { parent[rb] = ra; rank_[ra]++; }
}

int main(void) {
    for (int i = 0; i < 6; i++) { parent[i] = i; rank_[i] = 0; }
    union_sets(0, 1);
    union_sets(1, 2);
    printf("%d\n", find(0) == find(2));
    printf("%d\n", find(0) == find(5));
    return 0;
}
