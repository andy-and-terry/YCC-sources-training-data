type
  Edge = object
    src, dst, weight: int

  UnionFind = object
    parent: seq[int]
    rank: seq[int]

proc newUnionFind(n: int): UnionFind =
  result.parent = newSeq[int](n)
  result.rank = newSeq[int](n)
  for i in 0 ..< n:
    result.parent[i] = i

proc find(uf: var UnionFind, x: int): int =
  if uf.parent[x] != x:
    uf.parent[x] = find(uf, uf.parent[x])
  result = uf.parent[x]

proc union(uf: var UnionFind, x, y: int): bool =
  let rootX = find(uf, x)
  let rootY = find(uf, y)
  if rootX == rootY:
    return false
  if uf.rank[rootX] < uf.rank[rootY]:
    uf.parent[rootX] = rootY
  elif uf.rank[rootX] > uf.rank[rootY]:
    uf.parent[rootY] = rootX
  else:
    uf.parent[rootY] = rootX
    uf.rank[rootX] += 1
  result = true

proc kruskalMst(numVertices: int, edges: seq[Edge]): (seq[Edge], int) =
  var sortedEdges = edges
  sortedEdges.sort(proc (a, b: Edge): int = a.weight - b.weight)
  var uf = newUnionFind(numVertices)
  var mst: seq[Edge] = @[]
  var totalWeight = 0
  for e in sortedEdges:
    if union(uf, e.src, e.dst):
      mst.add(e)
      totalWeight += e.weight
  result = (mst, totalWeight)

let edges = @[
  Edge(src: 0, dst: 1, weight: 4),
  Edge(src: 0, dst: 2, weight: 4),
  Edge(src: 1, dst: 2, weight: 2),
  Edge(src: 1, dst: 0, weight: 4),
  Edge(src: 2, dst: 3, weight: 3),
  Edge(src: 3, dst: 4, weight: 2),
  Edge(src: 4, dst: 2, weight: 3)
]

let (mst, totalWeight) = kruskalMst(5, edges)
for e in mst:
  echo e.src, " - ", e.dst, " : ", e.weight
echo "total: ", totalWeight
