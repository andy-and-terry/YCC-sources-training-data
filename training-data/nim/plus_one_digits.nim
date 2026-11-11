proc plusOne(digits: seq[int]): seq[int] =
  result = digits
  for i in countdown(result.high, 0):
    if result[i] < 9:
      inc result[i]
      return
    result[i] = 0
  result.insert(1, 0)

echo plusOne(@[1, 2, 9]) # @[1, 3, 0]
echo plusOne(@[9, 9])    # @[1, 0, 0]
