type Stack[T] = object
  items: seq[T]

proc push[T](s: var Stack[T], item: T) =
  s.items.add(item)

proc pop[T](s: var Stack[T]): T =
  result = s.items[^1]
  s.items.setLen(s.items.len - 1)

proc peek[T](s: Stack[T]): T =
  s.items[^1]

proc isEmpty[T](s: Stack[T]): bool =
  s.items.len == 0

var s: Stack[int]
s.push(1)
s.push(2)
s.push(3)
echo pop(s), " ", peek(s), " ", isEmpty(s)
