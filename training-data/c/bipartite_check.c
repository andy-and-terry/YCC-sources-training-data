#include <stdio.h>

#define NUM_NODES 4

static int graph[NUM_NODES][NUM_NODES];

static void add_edge(int a, int b) {
    graph[a][b] = 1;
    graph[b][a] = 1;
}

/* Two-colors the graph via BFS; a neighbor already sharing the current
 * node's color means the graph isn't bipartite. */
static int is_bipartite(void) {
    int color[NUM_NODES];
    for (int i = 0; i < NUM_NODES; i++) color[i] = -1;

    for (int start = 0; start < NUM_NODES; start++) {
        if (color[start] != -1) continue;
        color[start] = 0;

        int queue[NUM_NODES];
        int head = 0, tail = 0;
        queue[tail++] = start;

        while (head < tail) {
            int node = queue[head++];
            for (int neighbor = 0; neighbor < NUM_NODES; neighbor++) {
                if (!graph[node][neighbor]) continue;
                if (color[neighbor] == -1) {
                    color[neighbor] = 1 - color[node];
                    queue[tail++] = neighbor;
                } else if (color[neighbor] == color[node]) {
                    return 0;
                }
            }
        }
    }
    return 1;
}

int main(void) {
    add_edge(0, 1);
    add_edge(1, 2);
    add_edge(2, 3);
    add_edge(3, 0);
    printf("even cycle bipartite: %d\n", is_bipartite());

    for (int i = 0; i < NUM_NODES; i++)
        for (int j = 0; j < NUM_NODES; j++) graph[i][j] = 0;

    add_edge(0, 1);
    add_edge(1, 2);
    add_edge(2, 0);
    printf("odd cycle bipartite: %d\n", is_bipartite());
    return 0;
}
