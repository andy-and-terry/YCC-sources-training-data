import std/tables

proc isBipartite(graph: Table[int, seq[int]], nodes: seq[int]): bool =
  var color = initTable[int, int]()
  for start in nodes:
    if start in color:
      continue
    color[start] = 0
    var queue = @[start]
    while queue.len > 0:
      let u = queue[0]
      queue.delete(0)
      for v in graph.getOrDefault(u, @[]):
        if v notin color:
          color[v] = 1 - color[u]
          queue.add(v)
        elif color[v] == color[u]:
          return false
  result = true

let evenCycle = {
  0: @[1, 3],
  1: @[0, 2],
  2: @[1, 3],
  3: @[0, 2]
}.toTable

let oddCycle = {
  0: @[1, 2],
  1: @[0, 2],
  2: @[0, 1]
}.toTable

echo isBipartite(evenCycle, @[0, 1, 2, 3])
echo isBipartite(oddCycle, @[0, 1, 2])
