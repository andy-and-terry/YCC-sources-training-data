const limit = 80
var composite: array[limit + 1, bool]
var i = 2
while i * i <= limit:
  if not composite[i]:
    for j in countup(i * i, limit, i): composite[j] = true
  inc i
for p in 3 .. limit - 2:
  if not composite[p] and not composite[p + 2]:
    stdout.write "(", p, ",", p + 2, ") "
echo "" # (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
