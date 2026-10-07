#include <stdio.h>
#include <limits.h>

#define V 5

int min_key(int key[], int in_mst[]) {
    int min = INT_MAX, min_index = -1;
    for (int v = 0; v < V; v++) {
        if (!in_mst[v] && key[v] < min) {
            min = key[v];
            min_index = v;
        }
    }
    return min_index;
}

void prim_mst(int graph[V][V]) {
    int parent[V];
    int key[V];
    int in_mst[V] = {0};

    for (int i = 0; i < V; i++) key[i] = INT_MAX;
    key[0] = 0;
    parent[0] = -1;

    for (int count = 0; count < V - 1; count++) {
        int u = min_key(key, in_mst);
        in_mst[u] = 1;
        for (int v = 0; v < V; v++) {
            if (graph[u][v] && !in_mst[v] && graph[u][v] < key[v]) {
                key[v] = graph[u][v];
                parent[v] = u;
            }
        }
    }

    int total_weight = 0;
    for (int i = 1; i < V; i++) {
        printf("%d - %d : %d\n", parent[i], i, key[i]);
        total_weight += key[i];
    }
    printf("total: %d\n", total_weight);
}

int main(void) {
    int graph[V][V] = {
        {0, 2, 0, 6, 0},
        {2, 0, 3, 8, 5},
        {0, 3, 0, 0, 7},
        {6, 8, 0, 0, 9},
        {0, 5, 7, 9, 0}
    };
    prim_mst(graph);
    return 0;
}
