proc toRoman(n: int): string =
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  var remaining = n
  result = ""
  for i in 0 ..< values.len:
    while remaining >= values[i]:
      result &= symbols[i]
      remaining -= values[i]

echo toRoman(1994)
