#include <stdio.h>
#include <limits.h>

#define N 5

/* A* over a small grid graph with an admissible heuristic (straight-line
 * estimate to the goal), falling back to Dijkstra's ordering when the
 * heuristic is zero. */
int heuristic[N] = {4, 2, 2, 1, 0};

int graph[N][N] = {
    {0, 1, 4, 0, 0},
    {1, 0, 2, 5, 0},
    {4, 2, 0, 1, 0},
    {0, 5, 1, 0, 3},
    {0, 0, 0, 3, 0}
};

int a_star(int start, int goal) {
    int g_score[N], visited[N] = {0};
    for (int i = 0; i < N; i++) g_score[i] = INT_MAX;
    g_score[start] = 0;

    for (int iter = 0; iter < N; iter++) {
        int current = -1, best_f = INT_MAX;
        for (int v = 0; v < N; v++) {
            if (!visited[v] && g_score[v] != INT_MAX) {
                int f = g_score[v] + heuristic[v];
                if (f < best_f) {
                    best_f = f;
                    current = v;
                }
            }
        }
        if (current == -1) break;
        if (current == goal) return g_score[goal];
        visited[current] = 1;

        for (int v = 0; v < N; v++) {
            if (graph[current][v] && !visited[v]) {
                int tentative = g_score[current] + graph[current][v];
                if (tentative < g_score[v]) {
                    g_score[v] = tentative;
                }
            }
        }
    }
    return g_score[goal];
}

int main(void) {
    printf("shortest path cost: %d\n", a_star(0, 4));
    return 0;
}
