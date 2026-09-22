from collections import deque


def is_bipartite(graph):
    """graph: dict of node -> list of neighbors. Returns True if 2-colorable."""
    color = {}

    for start in graph:
        if start in color:
            continue
        color[start] = 0
        queue = deque([start])
        while queue:
            node = queue.popleft()
            for neighbor in graph[node]:
                if neighbor not in color:
                    color[neighbor] = 1 - color[node]
                    queue.append(neighbor)
                elif color[neighbor] == color[node]:
                    return False

    return True


if __name__ == "__main__":
    bipartite_graph = {0: [1, 3], 1: [0, 2], 2: [1, 3], 3: [0, 2]}
    odd_cycle_graph = {0: [1, 2], 1: [0, 2], 2: [0, 1]}

    print(is_bipartite(bipartite_graph))
    print(is_bipartite(odd_cycle_graph))
