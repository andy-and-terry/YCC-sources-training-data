proc climbStairs(n: int): int =
  if n <= 2:
    return n
  var a = 1
  var b = 2
  for i in 3 .. n:
    let c = a + b
    a = b
    b = c
  result = b

echo climbStairs(2)
echo climbStairs(5)
echo climbStairs(10)
