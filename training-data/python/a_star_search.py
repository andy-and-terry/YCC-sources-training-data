import heapq


def a_star(graph, start, goal, heuristic):
    open_set = [(heuristic(start), 0, start)]
    came_from = {}
    g_score = {start: 0}

    while open_set:
        _, cost, current = heapq.heappop(open_set)
        if current == goal:
            path = [current]
            while current in came_from:
                current = came_from[current]
                path.append(current)
            return list(reversed(path)), cost

        for neighbor, weight in graph.get(current, []):
            tentative_g = g_score[current] + weight
            if tentative_g < g_score.get(neighbor, float("inf")):
                came_from[neighbor] = current
                g_score[neighbor] = tentative_g
                priority = tentative_g + heuristic(neighbor)
                heapq.heappush(open_set, (priority, tentative_g, neighbor))

    return None, float("inf")


if __name__ == "__main__":
    graph = {"A": [("B", 1), ("C", 4)], "B": [("C", 1), ("D", 5)], "C": [("D", 1)], "D": []}
    print(a_star(graph, "A", "D", lambda n: 0))
