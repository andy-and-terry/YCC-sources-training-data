proc isPowerOfTwo(n: int): bool =
  result = n > 0 and (n and (n - 1)) == 0

echo isPowerOfTwo(16)
echo isPowerOfTwo(18)
