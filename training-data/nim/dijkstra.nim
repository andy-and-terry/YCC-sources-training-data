import tables, sets

proc dijkstra(graph: Table[string, seq[(string, int)]], source: string): Table[string, int] =
  var dist = initTable[string, int]()
  for node in graph.keys:
    dist[node] = high(int)
  dist[source] = 0
  var visited = initHashSet[string]()

  for _ in 0 ..< graph.len:
    var bestNode = ""
    var bestDist = high(int)
    for node, d in dist:
      if node notin visited and d < bestDist:
        bestNode = node
        bestDist = d
    if bestNode == "":
      break
    visited.incl(bestNode)
    if graph.hasKey(bestNode):
      for (neighbor, weight) in graph[bestNode]:
        let newDist = dist[bestNode] + weight
        if newDist < dist[neighbor]:
          dist[neighbor] = newDist
  result = dist

let graph = {
  "a": @[("b", 1), ("c", 4)],
  "b": @[("c", 2), ("d", 5)],
  "c": @[("d", 1)],
  "d": newSeq[(string, int)]()
}.toTable
echo dijkstra(graph, "a")
