#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int src, dest, weight;
} Edge;

int find(int parent[], int i) {
    while (parent[i] != i) i = parent[i];
    return i;
}

void union_sets(int parent[], int a, int b) {
    parent[find(parent, a)] = find(parent, b);
}

int compare_edges(const void *a, const void *b) {
    return ((Edge *)a)->weight - ((Edge *)b)->weight;
}

int main(void) {
    Edge edges[] = {
        {0, 1, 10}, {0, 2, 6}, {0, 3, 5},
        {1, 3, 15}, {2, 3, 4}
    };
    int n_edges = sizeof(edges) / sizeof(edges[0]);
    int n_vertices = 4;

    qsort(edges, n_edges, sizeof(Edge), compare_edges);

    int parent[n_vertices];
    for (int i = 0; i < n_vertices; i++) parent[i] = i;

    int total_weight = 0;
    int chosen = 0;
    for (int i = 0; i < n_edges && chosen < n_vertices - 1; i++) {
        int u = find(parent, edges[i].src);
        int v = find(parent, edges[i].dest);
        if (u != v) {
            union_sets(parent, u, v);
            total_weight += edges[i].weight;
            printf("%d - %d : %d\n", edges[i].src, edges[i].dest, edges[i].weight);
            chosen++;
        }
    }
    printf("total: %d\n", total_weight);
    return 0;
}
