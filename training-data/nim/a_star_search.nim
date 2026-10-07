import std/[tables, sets, heapqueue]

type
  Node = tuple[x, y: int]

const
  grid = [
    [0, 0, 0, 0, 0],
    [0, 1, 1, 1, 0],
    [0, 0, 0, 1, 0],
    [1, 1, 0, 1, 0],
    [0, 0, 0, 0, 0],
  ]

proc heuristic(a, b: Node): int =
  abs(a.x - b.x) + abs(a.y - b.y)

proc neighbors(n: Node): seq[Node] =
  for d in [(1, 0), (-1, 0), (0, 1), (0, -1)]:
    let nx = n.x + d[0]
    let ny = n.y + d[1]
    if nx >= 0 and nx < grid.len and ny >= 0 and ny < grid[0].len and grid[nx][ny] == 0:
      result.add((nx, ny))

proc aStar(start, goal: Node): int =
  var openSet = initHeapQueue[(int, Node)]()
  openSet.push((heuristic(start, goal), start))
  var gScore = initTable[Node, int]()
  gScore[start] = 0
  var visited = initHashSet[Node]()

  while openSet.len > 0:
    let (_, current) = openSet.pop()
    if current == goal:
      return gScore[current]
    if current in visited:
      continue
    visited.incl(current)
    for next in neighbors(current):
      let tentative = gScore[current] + 1
      if next notin gScore or tentative < gScore[next]:
        gScore[next] = tentative
        openSet.push((tentative + heuristic(next, goal), next))

  return -1

echo aStar((0, 0), (4, 4))
