import std/tables

proc dfs(graph: Table[int, seq[int]], start: int, visited: var seq[bool], order: var seq[int]) =
  visited[start] = true
  order.add(start)
  if graph.hasKey(start):
    for neighbor in graph[start]:
      if not visited[neighbor]:
        dfs(graph, neighbor, visited, order)

let graph = {
  0: @[1, 2],
  1: @[0, 3],
  2: @[0, 3],
  3: @[1, 2]
}.toTable

var visited = newSeq[bool](graph.len)
var order: seq[int] = @[]
dfs(graph, 0, visited, order)
echo order
