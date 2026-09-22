type Edge = tuple[src, dst, weight: int]

proc bellmanFord(edges: seq[Edge], vertexCount, source: int): seq[int] =
  var dist = newSeq[int](vertexCount)
  for i in 0 ..< vertexCount:
    dist[i] = high(int)
  dist[source] = 0
  for i in 0 ..< vertexCount - 1:
    for e in edges:
      if dist[e.src] != high(int) and dist[e.src] + e.weight < dist[e.dst]:
        dist[e.dst] = dist[e.src] + e.weight
  for e in edges:
    if dist[e.src] != high(int) and dist[e.src] + e.weight < dist[e.dst]:
      raise newException(ValueError, "graph contains a negative-weight cycle")
  result = dist

let edges = @[
  (src: 0, dst: 1, weight: 4),
  (src: 0, dst: 2, weight: 1),
  (src: 2, dst: 1, weight: 2),
  (src: 1, dst: 3, weight: 1),
  (src: 2, dst: 3, weight: 5)
]
echo bellmanFord(edges, 4, 0)
