from collections import deque, defaultdict


def is_bipartite(num_nodes, edges):
    graph = defaultdict(list)
    for u, v in edges:
        graph[u].append(v)
        graph[v].append(u)

    color = {}

    for start in range(num_nodes):
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
    even_cycle = [(0, 1), (1, 2), (2, 3), (3, 0)]
    odd_cycle = [(0, 1), (1, 2), (2, 0)]
    print(is_bipartite(4, even_cycle))
    print(is_bipartite(3, odd_cycle))
