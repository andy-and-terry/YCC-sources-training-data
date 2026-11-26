"Goldbach partitions of 100; expect 6."
"Run with: gst <file>"

| isPrime |
isPrime := [:n |
    n < 2
        ifTrue: [false]
        ifFalse: [((2 to: n sqrt floor) detect: [:d | n \\ d = 0] ifNone: [nil]) isNil]].
(((2 to: 50) select: [:p | (isPrime value: p) and: [isPrime value: 100 - p]]) size) printNl.
