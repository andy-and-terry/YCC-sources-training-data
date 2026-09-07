template timesRepeat(n: int, body: untyped) =
  for i in 0 ..< n:
    body

template maxOf(a, b: untyped): untyped =
  (if a > b: a else: b)

timesRepeat(3):
  echo "tick"

echo maxOf(4, 9)
echo maxOf("pear", "plum")
