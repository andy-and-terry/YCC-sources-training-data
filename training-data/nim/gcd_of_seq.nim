import math

proc gcdAll(nums: openArray[int]): int =
  for n in nums: result = gcd(result, n)

echo gcdAll([12, 18, 24])
echo gcdAll([7, 13])
echo lcm(4, 6)
