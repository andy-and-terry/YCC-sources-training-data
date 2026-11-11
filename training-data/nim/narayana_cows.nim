# Narayana's cows N(n)=N(n-1)+N(n-3)
var v = @[1, 1, 1]
for i in 3 .. 9:
  v.add v[i - 1] + v[i - 3]
echo v
