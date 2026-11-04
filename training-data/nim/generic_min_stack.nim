type MinStack[T] = object
  items: seq[(T, T)]

proc push[T](s: var MinStack[T], x: T) =
  let m = if s.items.len > 0: min(x, s.items[^1][1]) else: x
  s.items.add (x, m)

proc pop[T](s: var MinStack[T]): T =
  s.items.pop()[0]

proc minimum[T](s: MinStack[T]): T = s.items[^1][1]

var s: MinStack[int]
for v in [5, 3, 7, 2]: s.push v
echo s.minimum
discard s.pop
echo s.minimum
