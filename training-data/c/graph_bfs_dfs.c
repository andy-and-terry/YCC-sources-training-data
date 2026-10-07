#include <stdio.h>
#include <stdlib.h>

#define NUM_VERTICES 6

typedef struct AdjNode {
    int vertex;
    struct AdjNode *next;
} AdjNode;

AdjNode *adjacency[NUM_VERTICES];

void add_edge(int u, int v) {
    AdjNode *node = malloc(sizeof(AdjNode));
    node->vertex = v;
    node->next = adjacency[u];
    adjacency[u] = node;
}

void bfs(int start) {
    int visited[NUM_VERTICES] = {0};
    int queue[NUM_VERTICES], front = 0, back = 0;

    visited[start] = 1;
    queue[back++] = start;

    printf("BFS:");
    while (front < back) {
        int u = queue[front++];
        printf(" %d", u);
        for (AdjNode *cur = adjacency[u]; cur; cur = cur->next) {
            if (!visited[cur->vertex]) {
                visited[cur->vertex] = 1;
                queue[back++] = cur->vertex;
            }
        }
    }
    printf("\n");
}

void dfs_visit(int u, int visited[]) {
    visited[u] = 1;
    printf(" %d", u);
    for (AdjNode *cur = adjacency[u]; cur; cur = cur->next) {
        if (!visited[cur->vertex]) dfs_visit(cur->vertex, visited);
    }
}

void dfs(int start) {
    int visited[NUM_VERTICES] = {0};
    printf("DFS:");
    dfs_visit(start, visited);
    printf("\n");
}

void free_graph(void) {
    for (int i = 0; i < NUM_VERTICES; i++) {
        AdjNode *cur = adjacency[i];
        while (cur) {
            AdjNode *next = cur->next;
            free(cur);
            cur = next;
        }
    }
}

int main(void) {
    add_edge(0, 1);
    add_edge(0, 2);
    add_edge(1, 3);
    add_edge(2, 4);
    add_edge(3, 5);
    add_edge(4, 5);

    bfs(0);
    dfs(0);

    free_graph();
    return 0;
}
