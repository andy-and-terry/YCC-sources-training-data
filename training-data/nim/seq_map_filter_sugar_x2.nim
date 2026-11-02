import sequtils, sugar

let xs = toSeq(1..10)
echo xs.filter(x => x mod 2 == 0).map(x => x * x)
