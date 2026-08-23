#include <stdio.h>

int graph[4][4] = {
    {0, 1, 1, 0},
    {0, 0, 0, 1},
    {0, 0, 0, 1},
    {0, 0, 0, 0}
};

int main(void) {
    int in_degree[4] = {0};
    for (int u = 0; u < 4; u++) {
        for (int v = 0; v < 4; v++) {
            if (graph[u][v]) in_degree[v]++;
        }
    }

    int queue[4], front = 0, back = 0;
    for (int i = 0; i < 4; i++) {
        if (in_degree[i] == 0) queue[back++] = i;
    }

    while (front < back) {
        int node = queue[front++];
        printf("%d ", node);
        for (int v = 0; v < 4; v++) {
            if (graph[node][v]) {
                in_degree[v]--;
                if (in_degree[v] == 0) queue[back++] = v;
            }
        }
    }
    printf("\n");
    return 0;
}
