import std.stdio;

void dfs(int[][int] graph, int node, ref bool[int] visited, ref int[] order) {
    if (node in visited) return;
    visited[node] = true;
    order ~= node;
    foreach (neighbor; graph.get(node, null)) {
        dfs(graph, neighbor, visited, order);
    }
}

void main() {
    int[][int] graph;
    graph[0] = [1, 2];
    graph[1] = [3];
    graph[2] = [3];
    graph[3] = [];

    bool[int] visited;
    int[] order;
    dfs(graph, 0, visited, order);
    writeln(order);
}
