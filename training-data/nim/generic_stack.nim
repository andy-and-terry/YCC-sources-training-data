type Stack[T] = object
  items: seq[T]

proc push[T](s: var Stack[T], x: T) =
  s.items.add(x)

proc pop[T](s: var Stack[T]): T =
  result = s.items[^1]
  s.items.setLen(s.items.len - 1)

var s: Stack[int]
s.push(1)
s.push(2)
s.push(3)
echo s.pop()
echo s.pop()
