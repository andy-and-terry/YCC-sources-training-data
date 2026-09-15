import tables, sets, deques

proc bfs(graph: Table[string, seq[string]], start: string): seq[string] =
  var visited = initHashSet[string]()
  var queue = initDeque[string]()
  queue.addLast(start)
  visited.incl(start)
  while queue.len > 0:
    let node = queue.popFirst()
    result.add(node)
    if graph.hasKey(node):
      for neighbor in graph[node]:
        if neighbor notin visited:
          visited.incl(neighbor)
          queue.addLast(neighbor)

let graph = {
  "a": @["b", "c"],
  "b": @["d"],
  "c": @["d"],
  "d": @["e"],
  "e": newSeq[string]()
}.toTable

echo bfs(graph, "a")
