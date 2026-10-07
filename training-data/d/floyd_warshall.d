import std.stdio;

enum int INF = 1_000_000;
enum size_t N = 4;

void main() {
    int[N][N] dist = [
        [0, 5, INF, 10],
        [INF, 0, 3, INF],
        [INF, INF, 0, 1],
        [INF, INF, INF, 0]
    ];

    foreach (k; 0 .. N) {
        foreach (i; 0 .. N) {
            foreach (j; 0 .. N) {
                if (dist[i][k] + dist[k][j] < dist[i][j]) {
                    dist[i][j] = dist[i][k] + dist[k][j];
                }
            }
        }
    }

    foreach (row; dist) {
        writeln(row);
    }
}
