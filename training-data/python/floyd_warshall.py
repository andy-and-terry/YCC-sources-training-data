def floyd_warshall(num_nodes, edges):
    INF = float("inf")
    dist = [[INF] * num_nodes for _ in range(num_nodes)]
    for i in range(num_nodes):
        dist[i][i] = 0
    for u, v, w in edges:
        dist[u][v] = w

    for k in range(num_nodes):
        for i in range(num_nodes):
            for j in range(num_nodes):
                if dist[i][k] + dist[k][j] < dist[i][j]:
                    dist[i][j] = dist[i][k] + dist[k][j]

    return dist


if __name__ == "__main__":
    edges = [(0, 1, 3), (0, 2, 8), (1, 2, 2), (2, 3, 1), (3, 0, 4)]
    for row in floyd_warshall(4, edges):
        print(row)
