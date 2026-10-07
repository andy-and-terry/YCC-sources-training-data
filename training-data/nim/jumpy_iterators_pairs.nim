let names = @["a", "b", "c"]
for i, n in names:
  echo i, ":", n

for i in countdown(10, 1, 3):
  echo i

for i in countup(0, 10, 5):
  echo i

for k, v in {"one": 1, "two": 2}:
  echo k, "=", v

for ch in "hey".items:
  echo ch.ord
