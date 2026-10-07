import random

const MaxLevel = 4

type
  SkipNode = ref object
    value: int
    forward: seq[SkipNode]

  SkipList = object
    head: SkipNode
    level: int

proc newSkipList(): SkipList =
  SkipList(head: SkipNode(value: low(int), forward: newSeq[SkipNode](MaxLevel)), level: 1)

proc randomLevel(): int =
  result = 1
  while rand(1.0) < 0.5 and result < MaxLevel:
    result += 1

proc insert(sl: var SkipList, value: int) =
  var update = newSeq[SkipNode](MaxLevel)
  var cur = sl.head
  for i in countdown(sl.level - 1, 0):
    while cur.forward[i] != nil and cur.forward[i].value < value:
      cur = cur.forward[i]
    update[i] = cur
  let lvl = randomLevel()
  if lvl > sl.level:
    for i in sl.level ..< lvl:
      update[i] = sl.head
    sl.level = lvl
  let node = SkipNode(value: value, forward: newSeq[SkipNode](lvl))
  for i in 0 ..< lvl:
    node.forward[i] = update[i].forward[i]
    update[i].forward[i] = node

proc contains(sl: SkipList, value: int): bool =
  var cur = sl.head
  for i in countdown(sl.level - 1, 0):
    while cur.forward[i] != nil and cur.forward[i].value < value:
      cur = cur.forward[i]
  cur = cur.forward[0]
  result = cur != nil and cur.value == value

randomize(42)
var sl = newSkipList()
for v in [3, 6, 7, 9, 12, 19]:
  sl.insert(v)
echo sl.contains(9)
echo sl.contains(10)
