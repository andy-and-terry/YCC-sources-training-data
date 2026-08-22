import heapq
from collections import defaultdict
from typing import Dict, List, Tuple


class Graph:
    def __init__(self):
        self.edges: Dict[str, List[Tuple[str, int]]] = defaultdict(list)

    def add_edge(self, u: str, v: str, weight: int, bidirectional: bool = True):
        self.edges[u].append((v, weight))
        if bidirectional:
            self.edges[v].append((u, weight))

    def dijkstra(self, start: str) -> Dict[str, int]:
        distances = {start: 0}
        visited = set()
        queue = [(0, start)]

        while queue:
            dist, node = heapq.heappop(queue)
            if node in visited:
                continue
            visited.add(node)

            for neighbor, weight in self.edges[node]:
                new_dist = dist + weight
                if neighbor not in distances or new_dist < distances[neighbor]:
                    distances[neighbor] = new_dist
                    heapq.heappush(queue, (new_dist, neighbor))

        return distances

    def shortest_path(self, start: str, end: str) -> Tuple[List[str], int]:
        distances = {start: 0}
        previous: Dict[str, str] = {}
        visited = set()
        queue = [(0, start)]

        while queue:
            dist, node = heapq.heappop(queue)
            if node in visited:
                continue
            visited.add(node)
            if node == end:
                break

            for neighbor, weight in self.edges[node]:
                new_dist = dist + weight
                if neighbor not in distances or new_dist < distances[neighbor]:
                    distances[neighbor] = new_dist
                    previous[neighbor] = node
                    heapq.heappush(queue, (new_dist, neighbor))

        if end not in distances:
            return [], -1

        path = [end]
        while path[-1] != start:
            path.append(previous[path[-1]])
        path.reverse()
        return path, distances[end]


if __name__ == "__main__":
    graph = Graph()
    graph.add_edge("A", "B", 4)
    graph.add_edge("A", "C", 1)
    graph.add_edge("C", "B", 2)
    graph.add_edge("B", "D", 5)
    graph.add_edge("C", "D", 8)

    print(graph.dijkstra("A"))
    print(graph.shortest_path("A", "D"))
