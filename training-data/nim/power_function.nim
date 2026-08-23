proc myPower(base, exp: int): int =
  if exp == 0:
    return 1
  if exp mod 2 == 0:
    let half = myPower(base, exp div 2)
    return half * half
  result = base * myPower(base, exp - 1)

echo myPower(2, 10)
echo myPower(3, 5)
