const n = 50
var composite: array[n + 1, bool]
var i = 2
while i * i <= n:
  if not composite[i]:
    for j in countup(i * i, n, i): composite[j] = true
  inc i
for p in 3 .. n - 2:
  if not composite[p] and not composite[p + 2]:
    echo "(", p, ", ", p + 2, ")"
