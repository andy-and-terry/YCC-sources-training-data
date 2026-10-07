const Inf = high(int)

proc primMst(graph: seq[seq[int]]): int =
  let n = graph.len
  var inMst = newSeq[bool](n)
  var key = newSeq[int](n)
  for i in 0 ..< n:
    key[i] = Inf
  key[0] = 0
  var total = 0

  for count in 0 ..< n:
    var u = -1
    for v in 0 ..< n:
      if not inMst[v] and (u == -1 or key[v] < key[u]):
        u = v
    inMst[u] = true
    total += key[u]
    for v in 0 ..< n:
      if graph[u][v] != 0 and not inMst[v] and graph[u][v] < key[v]:
        key[v] = graph[u][v]

  result = total

let graph = @[
  @[0, 2, 0, 6, 0],
  @[2, 0, 3, 8, 5],
  @[0, 3, 0, 0, 7],
  @[6, 8, 0, 0, 9],
  @[0, 5, 7, 9, 0]
]
echo primMst(graph)
