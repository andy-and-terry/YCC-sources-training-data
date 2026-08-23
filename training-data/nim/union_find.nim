type UnionFind = object
  parent: seq[int]

proc newUnionFind(n: int): UnionFind =
  result.parent = newSeq[int](n)
  for i in 0 ..< n:
    result.parent[i] = i

proc find(uf: UnionFind, x: int): int =
  if uf.parent[x] == x:
    return x
  return find(uf, uf.parent[x])

proc union(uf: var UnionFind, x, y: int) =
  let rootX = find(uf, x)
  let rootY = find(uf, y)
  if rootX != rootY:
    uf.parent[rootX] = rootY

var uf = newUnionFind(5)
uf.union(0, 1)
uf.union(1, 2)
echo find(uf, 0) == find(uf, 2)
echo find(uf, 0) == find(uf, 3)
