# Exact fraction arithmetic with std/rationals
import std/rationals

let a = 1 // 3
let b = 1 // 6

echo a + b
echo a - b
echo a * b
echo a / b
echo a > b
echo toFloat[float](a + b)

var total = 0 // 1
for d in 1 .. 5:
  total += 1 // (d * (d + 1))
echo total
