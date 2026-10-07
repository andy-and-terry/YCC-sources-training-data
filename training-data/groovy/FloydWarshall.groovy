def floydWarshall(List<int[]> graph) {
    int n = graph.size()
    def dist = graph.collect { it.clone() }

    for (int k = 0; k < n; k++) {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (dist[i][k] + dist[k][j] < dist[i][j]) {
                    dist[i][j] = dist[i][k] + dist[k][j]
                }
            }
        }
    }
    return dist
}

int INF = 99999
def graph = [
    [0, 5, INF, 10] as int[],
    [INF, 0, 3, INF] as int[],
    [INF, INF, 0, 1] as int[],
    [INF, INF, INF, 0] as int[]
]

floydWarshall(graph).each { println it.toList() }
