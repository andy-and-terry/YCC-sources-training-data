"""Kosaraju's algorithm: two depth-first passes find strongly connected
components in a directed graph -- one over the graph in finish-time
order, one over its transpose, grouping nodes that can reach each
other both ways. (tarjan_scc.py solves the same problem with a single
pass and a low-link stack; this is the two-pass alternative.)"""

from collections import defaultdict
from typing import Dict, List


def kosaraju_scc(graph: Dict[str, List[str]]) -> List[List[str]]:
    visited = set()
    finish_order = []

    def dfs1(node):
        stack = [(node, iter(graph.get(node, [])))]
        visited.add(node)
        while stack:
            current, neighbors = stack[-1]
            advanced = False
            for neighbor in neighbors:
                if neighbor not in visited:
                    visited.add(neighbor)
                    stack.append((neighbor, iter(graph.get(neighbor, []))))
                    advanced = True
                    break
            if not advanced:
                finish_order.append(current)
                stack.pop()

    for node in graph:
        if node not in visited:
            dfs1(node)

    reverse_graph = defaultdict(list)
    for node, neighbors in graph.items():
        for neighbor in neighbors:
            reverse_graph[neighbor].append(node)

    visited.clear()
    components = []

    def dfs2(node, component):
        stack = [node]
        visited.add(node)
        while stack:
            current = stack.pop()
            component.append(current)
            for neighbor in reverse_graph.get(current, []):
                if neighbor not in visited:
                    visited.add(neighbor)
                    stack.append(neighbor)

    for node in reversed(finish_order):
        if node not in visited:
            component: List[str] = []
            dfs2(node, component)
            components.append(component)

    return components


if __name__ == "__main__":
    graph = {
        "a": ["b"],
        "b": ["c"],
        "c": ["a", "d"],
        "d": ["e"],
        "e": ["f"],
        "f": ["d"],
    }
    for scc in kosaraju_scc(graph):
        print(sorted(scc))
