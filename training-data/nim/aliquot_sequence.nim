# Aliquot sequence: replace n by the sum of its proper divisors.
proc aliquotSum(n: int): int =
  for d in 1 .. n div 2:
    if n mod d == 0: result += d

var seq = @[12]
while seq[^1] > 1 and seq.len < 20:
  seq.add aliquotSum(seq[^1])
echo seq
