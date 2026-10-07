#include <stdio.h>

#define NUM_NODES 4

typedef enum { WHITE, GRAY, BLACK } Color;

static int graph[NUM_NODES][NUM_NODES];
static Color color[NUM_NODES];

/* A back edge to a node still GRAY (on the current DFS path) means the
 * directed graph contains a cycle; an edge to a BLACK node is fine. */
static int dfs_has_cycle(int node) {
    color[node] = GRAY;
    for (int neighbor = 0; neighbor < NUM_NODES; neighbor++) {
        if (!graph[node][neighbor]) continue;
        if (color[neighbor] == GRAY) return 1;
        if (color[neighbor] == WHITE && dfs_has_cycle(neighbor)) return 1;
    }
    color[node] = BLACK;
    return 0;
}

static int has_cycle(void) {
    for (int i = 0; i < NUM_NODES; i++) color[i] = WHITE;
    for (int i = 0; i < NUM_NODES; i++) {
        if (color[i] == WHITE && dfs_has_cycle(i)) return 1;
    }
    return 0;
}

int main(void) {
    /* 0 -> 1 -> 2 -> 3 -> 1 has a cycle among 1, 2, 3 */
    graph[0][1] = 1;
    graph[1][2] = 1;
    graph[2][3] = 1;
    graph[3][1] = 1;
    printf("cyclic graph has cycle: %d\n", has_cycle());

    for (int i = 0; i < NUM_NODES; i++)
        for (int j = 0; j < NUM_NODES; j++) graph[i][j] = 0;

    /* 0 -> 1 -> 2 -> 3, a DAG */
    graph[0][1] = 1;
    graph[1][2] = 1;
    graph[2][3] = 1;
    printf("acyclic graph has cycle: %d\n", has_cycle());
    return 0;
}
