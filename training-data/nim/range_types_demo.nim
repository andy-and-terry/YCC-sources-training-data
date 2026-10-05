type
  Percent = range[0..100]
  Weekday = range[1..7]

proc describe(p: Percent): string =
  if p < 50: "low" else: "high"

echo describe(30)
echo describe(75)
var d: Weekday = 3
echo d
try:
  var x = 150
  let p: Percent = x
  echo p
except RangeDefect as e:
  echo "range error: ", e.msg
echo low(Percent), "..", high(Percent)
