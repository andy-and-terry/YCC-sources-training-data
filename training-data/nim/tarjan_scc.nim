import std/sequtils

const N = 8
var adj: array[N, seq[int]]
var index: array[N, int]
var lowlink: array[N, int]
var onStack: array[N, bool]
var indexCounter = 0
var stack: seq[int] = @[]
var sccs: seq[seq[int]] = @[]

proc addEdge(u, v: int) =
  adj[u].add(v)

proc strongConnect(v: int) =
  index[v] = indexCounter
  lowlink[v] = indexCounter
  inc indexCounter
  stack.add(v)
  onStack[v] = true

  for w in adj[v]:
    if index[w] == -1:
      strongConnect(w)
      lowlink[v] = min(lowlink[v], lowlink[w])
    elif onStack[w]:
      lowlink[v] = min(lowlink[v], index[w])

  if lowlink[v] == index[v]:
    var component: seq[int] = @[]
    while true:
      let w = stack.pop()
      onStack[w] = false
      component.add(w)
      if w == v:
        break
    sccs.add(component)

for i in 0 ..< N:
  index[i] = -1

addEdge(0, 1)
addEdge(1, 2)
addEdge(2, 0)
addEdge(2, 3)
addEdge(3, 4)
addEdge(4, 5)
addEdge(5, 3)
addEdge(6, 5)
addEdge(6, 7)

for i in 0 ..< N:
  if index[i] == -1:
    strongConnect(i)

for component in sccs:
  echo component.reversed
