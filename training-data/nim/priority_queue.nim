type PriorityQueue = object
  items: seq[int]

proc push(pq: var PriorityQueue, value: int) =
  pq.items.add(value)
  var i = pq.items.len - 1
  while i > 0:
    let parent = (i - 1) div 2
    if pq.items[parent] <= pq.items[i]: break
    swap(pq.items[parent], pq.items[i])
    i = parent

proc pop(pq: var PriorityQueue): int =
  result = pq.items[0]
  pq.items[0] = pq.items[^1]
  pq.items.setLen(pq.items.len - 1)
  var i = 0
  while true:
    let left = 2 * i + 1
    let right = 2 * i + 2
    var smallest = i
    if left < pq.items.len and pq.items[left] < pq.items[smallest]: smallest = left
    if right < pq.items.len and pq.items[right] < pq.items[smallest]: smallest = right
    if smallest == i: break
    swap(pq.items[i], pq.items[smallest])
    i = smallest

proc isEmpty(pq: PriorityQueue): bool = pq.items.len == 0

var pq: PriorityQueue
for v in [5, 2, 8, 1, 9, 3]:
  pq.push(v)
while not pq.isEmpty:
  echo pq.pop()
