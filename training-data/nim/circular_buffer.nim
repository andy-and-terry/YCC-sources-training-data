type CircularBuffer = object
  data: seq[int]
  capacity: int
  size: int
  start: int

proc newCircularBuffer(capacity: int): CircularBuffer =
  CircularBuffer(data: newSeq[int](capacity), capacity: capacity, size: 0, start: 0)

proc push(buf: var CircularBuffer, value: int) =
  let index = (buf.start + buf.size) mod buf.capacity
  buf.data[index] = value
  if buf.size < buf.capacity:
    inc buf.size
  else:
    buf.start = (buf.start + 1) mod buf.capacity

proc toSeq(buf: CircularBuffer): seq[int] =
  for i in 0 ..< buf.size:
    result.add(buf.data[(buf.start + i) mod buf.capacity])

var buf = newCircularBuffer(3)
for v in [1, 2, 3, 4, 5]:
  buf.push(v)
echo buf.toSeq()
