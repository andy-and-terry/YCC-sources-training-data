type Queue[T] = object
  items: seq[T]

proc enqueue[T](q: var Queue[T], x: T) =
  q.items.add(x)

proc dequeue[T](q: var Queue[T]): T =
  result = q.items[0]
  q.items.delete(0)

proc peek[T](q: Queue[T]): T =
  q.items[0]

proc isEmpty[T](q: Queue[T]): bool =
  q.items.len == 0

var q: Queue[string]
q.enqueue("a")
q.enqueue("b")
q.enqueue("c")
echo q.dequeue()
echo q.peek()
echo q.isEmpty()
