import 'dart:collection';

class Graph {
  final Map<int, List<int>> _adj = {};

  void addEdge(int u, int v) {
    _adj.putIfAbsent(u, () => []).add(v);
    _adj.putIfAbsent(v, () => []).add(u);
  }

  List<int> bfs(int start) {
    final visited = <int>{start};
    final order = <int>[];
    final queue = Queue<int>()..add(start);

    while (queue.isNotEmpty) {
      final node = queue.removeFirst();
      order.add(node);
      for (final next in _adj[node] ?? []) {
        if (visited.add(next)) {
          queue.add(next);
        }
      }
    }
    return order;
  }

  List<int> dfs(int start) {
    final visited = <int>{};
    final order = <int>[];

    void visit(int node) {
      if (!visited.add(node)) return;
      order.add(node);
      for (final next in _adj[node] ?? []) {
        visit(next);
      }
    }

    visit(start);
    return order;
  }
}

void main() {
  final graph = Graph()
    ..addEdge(1, 2)
    ..addEdge(1, 3)
    ..addEdge(2, 4)
    ..addEdge(3, 4)
    ..addEdge(4, 5);

  print(graph.bfs(1));
  print(graph.dfs(1));
}
