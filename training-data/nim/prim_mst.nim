const Inf = high(int)

proc primMst(graph: seq[seq[int]]): (int, seq[(int, int)]) =
  let n = graph.len
  var inMst = newSeq[bool](n)
  var minEdge = newSeq[int](n)
  var parent = newSeq[int](n)
  for i in 0 ..< n:
    minEdge[i] = Inf
    parent[i] = -1
  minEdge[0] = 0

  var totalWeight = 0
  var edges: seq[(int, int)] = @[]

  for _ in 0 ..< n:
    var u = -1
    for v in 0 ..< n:
      if not inMst[v] and (u == -1 or minEdge[v] < minEdge[u]):
        u = v
    inMst[u] = true
    totalWeight += minEdge[u]
    if parent[u] != -1:
      edges.add((parent[u], u))

    for v in 0 ..< n:
      if graph[u][v] != 0 and not inMst[v] and graph[u][v] < minEdge[v]:
        minEdge[v] = graph[u][v]
        parent[v] = u

  result = (totalWeight, edges)

let graph = @[
  @[0, 2, 0, 6, 0],
  @[2, 0, 3, 8, 5],
  @[0, 3, 0, 0, 7],
  @[6, 8, 0, 0, 9],
  @[0, 5, 7, 9, 0]
]

let (weight, edges) = primMst(graph)
for e in edges:
  echo e[0], " - ", e[1]
echo "total: ", weight
