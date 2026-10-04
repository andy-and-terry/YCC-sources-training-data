import std/deques

var d = initDeque[int]()
d.addLast(1)
d.addLast(2)
d.addFirst(0)
d.addFirst(-1)
echo d            # [-1, 0, 1, 2]
echo d.popFirst() # -1
echo d.popLast()  # 2
echo d.len, " ", d[0], " ", d[^1]

# sliding window sum with a deque
var window = initDeque[int]()
var sum = 0
for x in [3, 1, 4, 1, 5, 9, 2, 6]:
  window.addLast x
  sum += x
  if window.len > 3:
    sum -= window.popFirst()
  if window.len == 3:
    echo "window ", window, " sum ", sum
