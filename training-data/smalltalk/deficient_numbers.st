"Deficient numbers below 100; expect 76."
"Run with: gst <file>"

| properSum |
properSum := [:n |
    ((1 to: n - 1) select: [:d | n \\ d = 0]) inject: 0 into: [:a :b | a + b]].
((1 to: 99) select: [:n | (properSum value: n) < n]) size printNl.
