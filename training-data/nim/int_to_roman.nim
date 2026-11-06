# Integer (1..3999) to Roman numeral using a greedy table.
const table = [
  (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"),
  (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]

proc toRoman(number: int): string =
  var n = number
  for (value, symbol) in table:
    while n >= value:
      result.add symbol
      n -= value

echo toRoman(1994), " ", toRoman(58)
