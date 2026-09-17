import std.stdio;
import std.algorithm : map;
import std.array : array;

struct Edge {
    int to;
    int weight;
}

int[] dijkstra(Edge[][int] graph, int source, int nodeCount) {
    enum INF = int.max;
    auto dist = new int[](nodeCount);
    dist[] = INF;
    dist[source] = 0;
    auto visited = new bool[](nodeCount);

    foreach (_; 0 .. nodeCount) {
        int u = -1;
        int best = INF;
        foreach (i; 0 .. nodeCount) {
            if (!visited[i] && dist[i] < best) {
                best = dist[i];
                u = i;
            }
        }
        if (u == -1) break;

        visited[u] = true;
        if (auto edges = u in graph) {
            foreach (e; *edges) {
                if (dist[u] != INF && dist[u] + e.weight < dist[e.to]) {
                    dist[e.to] = dist[u] + e.weight;
                }
            }
        }
    }

    return dist;
}

void main() {
    Edge[][int] graph;
    graph[0] = [Edge(1, 4), Edge(2, 1)];
    graph[1] = [Edge(3, 1)];
    graph[2] = [Edge(1, 2), Edge(3, 5)];
    graph[3] = [];

    writeln(dijkstra(graph, 0, 4));
}
