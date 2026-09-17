const val INF = Int.MAX_VALUE / 2

fun floydWarshall(graph: Array<IntArray>): Array<IntArray> {
    val n = graph.size
    val dist = Array(n) { i -> IntArray(n) { j -> graph[i][j] } }
    for (k in 0 until n) {
        for (i in 0 until n) {
            for (j in 0 until n) {
                if (dist[i][k] + dist[k][j] < dist[i][j]) {
                    dist[i][j] = dist[i][k] + dist[k][j]
                }
            }
        }
    }
    return dist
}

fun main() {
    val graph = arrayOf(
        intArrayOf(0, 3, INF, 7),
        intArrayOf(8, 0, 2, INF),
        intArrayOf(5, INF, 0, 1),
        intArrayOf(2, INF, INF, 0)
    )
    val dist = floydWarshall(graph)
    for (row in dist) println(row.joinToString(" ") { if (it >= INF) "INF" else it.toString() })
}
