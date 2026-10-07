import std/sequtils

type
  Bag[T] = object
    data: seq[T]

proc add[T](b: var Bag[T], x: T) =
  b.data.add(x)

iterator items[T](b: Bag[T]): T =
  for x in b.data:
    yield x

var bag: Bag[int]
bag.add(1)
bag.add(2)
bag.add(3)

for x in bag:
  echo x

echo toSeq(bag)
