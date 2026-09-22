const INF = 1_000_000

proc floydWarshall(graph: seq[seq[int]]): seq[seq[int]] =
  let n = graph.len
  result = graph
  for k in 0 ..< n:
    for i in 0 ..< n:
      for j in 0 ..< n:
        if result[i][k] + result[k][j] < result[i][j]:
          result[i][j] = result[i][k] + result[k][j]

let graph = @[
  @[0, 5, INF, 10],
  @[INF, 0, 3, INF],
  @[INF, INF, 0, 1],
  @[INF, INF, INF, 0]
]

let dist = floydWarshall(graph)
for row in dist:
  echo row
