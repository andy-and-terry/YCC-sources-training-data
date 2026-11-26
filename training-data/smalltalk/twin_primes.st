"Twin primes below 100; expect 8."
"Run with: gst <file>"

| isPrime |
isPrime := [:n |
    n < 2
        ifTrue: [false]
        ifFalse: [((2 to: n sqrt floor) detect: [:d | n \\ d = 0] ifNone: [nil]) isNil]].
(((2 to: 99) select: [:p | (isPrime value: p) and: [isPrime value: p + 2]]) size) printNl.
