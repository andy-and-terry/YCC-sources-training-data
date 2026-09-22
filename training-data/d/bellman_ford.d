import std.stdio;

struct Edge {
    int from;
    int to;
    int weight;
}

int[] bellmanFord(Edge[] edges, int nodeCount, int source) {
    enum INF = int.max;
    auto dist = new int[](nodeCount);
    dist[] = INF;
    dist[source] = 0;

    foreach (_; 0 .. nodeCount - 1) {
        foreach (e; edges) {
            if (dist[e.from] != INF && dist[e.from] + e.weight < dist[e.to]) {
                dist[e.to] = dist[e.from] + e.weight;
            }
        }
    }

    foreach (e; edges) {
        if (dist[e.from] != INF && dist[e.from] + e.weight < dist[e.to]) {
            writeln("negative-weight cycle detected");
        }
    }

    return dist;
}

void main() {
    auto edges = [
        Edge(0, 1, 4),
        Edge(0, 2, 1),
        Edge(2, 1, 2),
        Edge(1, 3, 1),
        Edge(2, 3, 5),
    ];

    writeln(bellmanFord(edges, 4, 0));
}
