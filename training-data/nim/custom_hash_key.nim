import std/tables
import std/hashes

type
  Point = object
    x, y: int

proc hash(p: Point): Hash =
  var h: Hash = 0
  h = h !& hash(p.x)
  h = h !& hash(p.y)
  result = !$h

proc `==`(a, b: Point): bool =
  a.x == b.x and a.y == b.y

var seen = initTable[Point, string]()
seen[Point(x: 1, y: 2)] = "origin-ish"
seen[Point(x: 3, y: 4)] = "far"

echo seen[Point(x: 1, y: 2)]
echo Point(x: 5, y: 5) in seen
