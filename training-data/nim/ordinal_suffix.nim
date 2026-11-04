proc ordinal(n: int): string =
  let r100 = n mod 100
  let suffix =
    if r100 in 11 .. 13: "th"
    else:
      case n mod 10
      of 1: "st"
      of 2: "nd"
      of 3: "rd"
      else: "th"
  $n & suffix

for n in [1, 2, 3, 4, 11, 12, 13, 21, 101, 111]: stdout.write ordinal(n), " "
echo ""
