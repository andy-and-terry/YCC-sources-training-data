int INF = Integer.MAX_VALUE / 2

def bellmanFord(int numNodes, List<int[]> edges, int source) {
    int[] dist = new int[numNodes]
    Arrays.fill(dist, INF)
    dist[source] = 0

    for (int i = 0; i < numNodes - 1; i++) {
        edges.each { edge ->
            int u = edge[0], v = edge[1], w = edge[2]
            if (dist[u] != INF && dist[u] + w < dist[v]) {
                dist[v] = dist[u] + w
            }
        }
    }

    boolean hasNegativeCycle = false
    edges.each { edge ->
        int u = edge[0], v = edge[1], w = edge[2]
        if (dist[u] != INF && dist[u] + w < dist[v]) {
            hasNegativeCycle = true
        }
    }

    return hasNegativeCycle ? null : dist
}

def edges = [[0, 1, 4] as int[], [0, 2, 5] as int[], [1, 2, -3] as int[], [2, 3, 4] as int[], [3, 1, -6] as int[]]
println bellmanFord(4, edges, 0)
