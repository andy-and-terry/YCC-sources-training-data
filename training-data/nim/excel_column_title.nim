proc columnTitle(num: int): string =
  var n = num
  while n > 0:
    dec n
    result = chr(ord('A') + n mod 26) & result
    n = n div 26

echo columnTitle(28), " ", columnTitle(701) # AB ZY
