def floydWarshall(List<List<Integer>> graph) {
    int n = graph.size()
    def dist = graph.collect { row -> row.collect { it } }

    for (k in 0..<n) {
        for (i in 0..<n) {
            for (j in 0..<n) {
                if (dist[i][k] + dist[k][j] < dist[i][j]) {
                    dist[i][j] = dist[i][k] + dist[k][j]
                }
            }
        }
    }
    return dist
}

int INF = Integer.MAX_VALUE / 2 as int
def graph = [
    [0, 5, INF, 10],
    [INF, 0, 3, INF],
    [INF, INF, 0, 1],
    [INF, INF, INF, 0],
]

floydWarshall(graph).each { println it }
