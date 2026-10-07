from collections import deque
from typing import Dict, List


def bfs_find_path(capacity: Dict[str, Dict[str, int]], source: str, sink: str):
    parent = {source: None}
    queue = deque([source])
    while queue:
        u = queue.popleft()
        if u == sink:
            break
        for v, cap in capacity.get(u, {}).items():
            if cap > 0 and v not in parent:
                parent[v] = u
                queue.append(v)
    if sink not in parent:
        return None
    path: List[str] = []
    node = sink
    while node is not None:
        path.append(node)
        node = parent[node]
    return list(reversed(path))


def max_flow(graph: Dict[str, Dict[str, int]], source: str, sink: str) -> int:
    """Edmonds-Karp (BFS-based Ford-Fulkerson) maximum flow."""
    capacity = {u: dict(edges) for u, edges in graph.items()}
    for u, edges in graph.items():
        for v in edges:
            capacity.setdefault(v, {}).setdefault(u, 0)

    total_flow = 0
    while True:
        path = bfs_find_path(capacity, source, sink)
        if path is None:
            break
        bottleneck = min(capacity[path[i]][path[i + 1]] for i in range(len(path) - 1))
        for i in range(len(path) - 1):
            u, v = path[i], path[i + 1]
            capacity[u][v] -= bottleneck
            capacity[v][u] += bottleneck
        total_flow += bottleneck
    return total_flow


if __name__ == "__main__":
    graph = {
        "s": {"a": 10, "b": 5},
        "a": {"b": 15, "t": 10},
        "b": {"t": 10},
    }
    print(max_flow(graph, "s", "t"))
