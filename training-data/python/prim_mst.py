import heapq
from collections import defaultdict


def prim(num_nodes, edges):
    graph = defaultdict(list)
    for u, v, w in edges:
        graph[u].append((w, v))
        graph[v].append((w, u))

    visited = set([0])
    heap = graph[0][:]
    heapq.heapify(heap)
    mst_weight = 0

    while heap and len(visited) < num_nodes:
        weight, node = heapq.heappop(heap)
        if node in visited:
            continue
        visited.add(node)
        mst_weight += weight
        for next_weight, neighbor in graph[node]:
            if neighbor not in visited:
                heapq.heappush(heap, (next_weight, neighbor))

    return mst_weight


if __name__ == "__main__":
    edges = [(0, 1, 1), (0, 2, 3), (1, 2, 4), (1, 3, 2), (2, 3, 5)]
    print(prim(4, edges))
