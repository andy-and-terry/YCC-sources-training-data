proc digitSum(n: int): int =
  var num = n
  while num > 0:
    result += num mod 10
    num = num div 10

echo digitSum(12345)
