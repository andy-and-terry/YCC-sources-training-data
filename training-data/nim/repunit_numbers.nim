# Repunits: numbers made only of the digit 1.
var r = 0
var output: seq[int]
for _ in 1 .. 5:
  r = r * 10 + 1
  output.add r
echo output
