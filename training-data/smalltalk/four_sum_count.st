| a b c d sums count |
a := #(1 2). b := #(-2 -1). c := #(-1 2). d := #(0 2).
sums := Dictionary new.
a do: [:x | b do: [:y | sums at: x + y put: (sums at: x + y ifAbsent: [0]) + 1]].
count := 0.
c do: [:x | d do: [:y | count := count + (sums at: (x + y) negated ifAbsent: [0])]].
Transcript showCr: count printString. "2"
