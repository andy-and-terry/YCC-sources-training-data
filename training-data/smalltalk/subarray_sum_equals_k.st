"Count contiguous subarrays whose sum equals k (prefix sums + Dictionary)."
| nums k seen total count |
nums := #(1 1 1).
k := 2.
seen := Dictionary new.
seen at: 0 put: 1.
total := 0.
count := 0.
nums do: [:x |
    total := total + x.
    count := count + (seen at: total - k ifAbsent: [0]).
    seen at: total put: (seen at: total ifAbsent: [0]) + 1].
Transcript showCr: count printString.
