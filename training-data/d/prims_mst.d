import std.stdio;

int primMst(int[][] graph) {
    int n = cast(int) graph.length;
    auto key = new int[n];
    auto inMst = new bool[n];
    immutable int inf = int.max;
    key[] = inf;
    key[0] = 0;
    int total = 0;

    foreach (count; 0 .. n) {
        int u = -1;
        int minKey = inf;
        foreach (v; 0 .. n) {
            if (!inMst[v] && key[v] < minKey) {
                minKey = key[v];
                u = v;
            }
        }
        if (u == -1) break;
        inMst[u] = true;
        total += key[u];
        foreach (v; 0 .. n) {
            if (graph[u][v] != 0 && !inMst[v] && graph[u][v] < key[v]) {
                key[v] = graph[u][v];
            }
        }
    }

    return total;
}

void main() {
    int[][] graph = [
        [0, 2, 3, 0, 0],
        [2, 0, 1, 4, 0],
        [3, 1, 0, 5, 6],
        [0, 4, 5, 0, 7],
        [0, 0, 6, 7, 0],
    ];
    writeln(primMst(graph));
}
