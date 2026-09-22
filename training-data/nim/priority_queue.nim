type
  MinHeap = object
    data: seq[int]

proc push(h: var MinHeap, value: int) =
  h.data.add(value)
  var i = h.data.len - 1
  while i > 0:
    let parent = (i - 1) div 2
    if h.data[parent] <= h.data[i]:
      break
    swap(h.data[parent], h.data[i])
    i = parent

proc pop(h: var MinHeap): int =
  result = h.data[0]
  h.data[0] = h.data[^1]
  h.data.setLen(h.data.len - 1)
  var i = 0
  while true:
    let left = 2 * i + 1
    let right = 2 * i + 2
    var smallest = i
    if left < h.data.len and h.data[left] < h.data[smallest]:
      smallest = left
    if right < h.data.len and h.data[right] < h.data[smallest]:
      smallest = right
    if smallest == i:
      break
    swap(h.data[i], h.data[smallest])
    i = smallest

proc isEmpty(h: MinHeap): bool = h.data.len == 0

var pq = MinHeap(data: @[])
for v in [5, 2, 8, 1, 9, 3]:
  pq.push(v)

while not pq.isEmpty:
  stdout.write(pq.pop(), " ")
echo ""
