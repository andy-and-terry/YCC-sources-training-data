import tables, sets, deques

proc bfs(graph: Table[int, seq[int]], start: int): seq[int] =
  var visited = initHashSet[int]()
  var queue = initDeque[int]()
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
  0: @[1, 2],
  1: @[0, 3],
  2: @[0, 3],
  3: @[1, 2]
}.toTable
echo bfs(graph, 0)
