def bellman_ford(num_nodes, edges, source):
    dist = [float("inf")] * num_nodes
    dist[source] = 0

    for _ in range(num_nodes - 1):
        for u, v, w in edges:
            if dist[u] + w < dist[v]:
                dist[v] = dist[u] + w

    for u, v, w in edges:
        if dist[u] + w < dist[v]:
            raise ValueError("graph contains a negative-weight cycle")

    return dist


if __name__ == "__main__":
    edges = [(0, 1, 4), (0, 2, 5), (1, 2, -3), (2, 3, 4)]
    print(bellman_ford(4, edges, 0))
