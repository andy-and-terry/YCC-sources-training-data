import std.stdio;

immutable int INF = int.max / 2;

int[][] floydWarshall(int numNodes, int[3][] edges) {
    auto dist = new int[][](numNodes, numNodes);
    foreach (i; 0 .. numNodes) {
        foreach (j; 0 .. numNodes) {
            dist[i][j] = (i == j) ? 0 : INF;
        }
    }
    foreach (edge; edges) {
        dist[edge[0]][edge[1]] = edge[2];
    }

    foreach (k; 0 .. numNodes) {
        foreach (i; 0 .. numNodes) {
            foreach (j; 0 .. numNodes) {
                if (dist[i][k] + dist[k][j] < dist[i][j]) {
                    dist[i][j] = dist[i][k] + dist[k][j];
                }
            }
        }
    }

    return dist;
}

void main() {
    int[3][] edges = [
        [0, 1, 3],
        [0, 2, 8],
        [1, 2, 2],
        [2, 3, 1],
        [3, 0, 4],
    ];

    auto dist = floydWarshall(4, edges);
    foreach (row; dist) {
        writeln(row);
    }
}
