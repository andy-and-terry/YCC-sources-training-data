import tables, sets

proc visit(node: string, graph: Table[string, seq[string]], visited: var HashSet[string], order: var seq[string]) =
  if node in visited:
    return
  visited.incl(node)
  if graph.hasKey(node):
    for dep in graph[node]:
      visit(dep, graph, visited, order)
  order.add(node)

proc topoSort(graph: Table[string, seq[string]]): seq[string] =
  var visited = initHashSet[string]()
  var order: seq[string] = @[]
  for node in graph.keys:
    visit(node, graph, visited, order)
  result = order

let graph = {"a": @["b", "c"], "b": @["d"], "c": @["d"], "d": @[]}.toTable
echo topoSort(graph)
