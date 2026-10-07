#include <stdio.h>
#include <string.h>

#define V 8

int adj[V][V];
int index_counter = 0;
int sccCount = 0;
int disc[V], low[V], onStack[V], stack[V], sp = 0;

void tarjan(int u) {
    disc[u] = low[u] = index_counter++;
    stack[sp++] = u;
    onStack[u] = 1;

    for (int v = 0; v < V; v++) {
        if (!adj[u][v]) continue;
        if (disc[v] == -1) {
            tarjan(v);
            if (low[v] < low[u]) low[u] = low[v];
        } else if (onStack[v]) {
            if (disc[v] < low[u]) low[u] = disc[v];
        }
    }

    if (low[u] == disc[u]) {
        printf("SCC %d:", sccCount++);
        int w;
        do {
            w = stack[--sp];
            onStack[w] = 0;
            printf(" %d", w);
        } while (w != u);
        printf("\n");
    }
}

int main(void) {
    memset(disc, -1, sizeof(disc));
    memset(low, -1, sizeof(low));
    memset(onStack, 0, sizeof(onStack));

    /* Two SCCs: {0,1,2} and {3,4}; 5,6,7 are singleton components. */
    adj[0][1] = 1;
    adj[1][2] = 1;
    adj[2][0] = 1;
    adj[2][3] = 1;
    adj[3][4] = 1;
    adj[4][3] = 1;
    adj[5][6] = 1;
    adj[6][7] = 1;

    for (int i = 0; i < V; i++) {
        if (disc[i] == -1) tarjan(i);
    }

    printf("total SCCs: %d\n", sccCount);
    return 0;
}
