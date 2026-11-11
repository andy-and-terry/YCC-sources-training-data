# Perrin sequence P(n)=P(n-2)+P(n-3)
var v = @[3, 0, 2]
for i in 3 .. 9:
  v.add v[i - 2] + v[i - 3]
echo v
