#include <stdio.h>
#include <limits.h>

#define V 5
#define E 8

typedef struct {
    int src, dest, weight;
} Edge;

void bellman_ford(Edge edges[], int e, int src) {
    int dist[V];
    for (int i = 0; i < V; i++) dist[i] = INT_MAX;
    dist[src] = 0;

    for (int i = 1; i < V; i++) {
        for (int j = 0; j < e; j++) {
            int u = edges[j].src, v = edges[j].dest, w = edges[j].weight;
            if (dist[u] != INT_MAX && dist[u] + w < dist[v]) {
                dist[v] = dist[u] + w;
            }
        }
    }

    for (int j = 0; j < e; j++) {
        int u = edges[j].src, v = edges[j].dest, w = edges[j].weight;
        if (dist[u] != INT_MAX && dist[u] + w < dist[v]) {
            printf("negative cycle detected\n");
            return;
        }
    }

    for (int i = 0; i < V; i++) printf("%d: %d\n", i, dist[i]);
}

int main(void) {
    Edge edges[E] = {
        {0, 1, -1}, {0, 2, 4}, {1, 2, 3}, {1, 3, 2},
        {1, 4, 2}, {3, 2, 5}, {3, 1, 1}, {4, 3, -3}
    };
    bellman_ford(edges, E, 0);
    return 0;
}
