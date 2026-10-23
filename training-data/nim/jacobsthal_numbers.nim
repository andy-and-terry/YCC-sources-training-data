# Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
import strutils

iterator jacobsthal(count: int): int =
  var (a, b) = (0, 1)
  for _ in 1 .. count:
    yield a
    (a, b) = (b, b + 2 * a)

var terms: seq[string]
for j in jacobsthal(15):
  terms.add $j
echo terms.join(" ")
